//  The MIT License (MIT)
//
//  Copyright (c) 2019 ForC heqiao.china@gmail.com
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the “Software”), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

#import "FCRouter.h"
#import <objc/runtime.h>

typedef NS_ENUM(NSInteger, FCRouterMatchType) {
    FCRouterMatchTypeNone,
    FCRouterMatchTypeHandle,
    FCRouterMatchTypeClass
};

static NSString *_FCRouterMatchType = @"_FCRouterMatchType";
static NSString *_FCRouterMatchContent = @"_";
NSString *FCRouterKey = @"_FCRouter";

static NSDictionary *FCRouterCustomParamters(NSMutableDictionary *routerParamters, NSString *url) {
    [routerParamters removeObjectForKey:_FCRouterMatchType];
    [routerParamters removeObjectForKey:_FCRouterMatchContent];
    routerParamters[FCRouterKey] = url;
    for (NSString *paraString in [[NSURL URLWithString:url].query componentsSeparatedByString:@"&"]) {
        NSArray *paraArray = [paraString componentsSeparatedByString:@"="];
        if (paraArray.count != 2) {
            continue;
        }
        routerParamters[paraArray.firstObject] = paraArray.lastObject;
    }
    return routerParamters.copy;
}

@interface FCRouter ()

@property (nonatomic, strong) dispatch_queue_t routeMapsModificationQueue;

@property (nonatomic, strong) NSMutableDictionary *routerMaps;

@end

@implementation FCRouter

+ (instancetype)share {
    static FCRouter *router = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        router = [self new];
        router.routeMapsModificationQueue = dispatch_queue_create("FCRouterMapsModificationQueue", DISPATCH_QUEUE_CONCURRENT);
    });
    return router;
}

- (NSMutableDictionary *)routerMaps {
    if (!_routerMaps) {
        _routerMaps = [NSMutableDictionary dictionary];
    }
    return _routerMaps;
}

- (void)regsiterPlistPathForSource:(NSString *)source bundle:(NSBundle *)bundle {
    dispatch_barrier_async(self.routeMapsModificationQueue, ^{
        NSDictionary *plistMap = [NSDictionary dictionaryWithContentsOfFile:[bundle pathForResource:source ofType:@"plist"]];
        for (NSString *key in plistMap.allKeys) {
            NSString *value = plistMap[key];
            NSMutableDictionary *subrouter   = [self addRouters:key];
            subrouter[_FCRouterMatchContent] = NSClassFromString(value);
            subrouter[_FCRouterMatchType]    = @(FCRouterMatchTypeClass);
        }
    });
}

- (void)regsiterUrl:(NSString *)url mapViewControllerClass:(Class)VCClass {
    dispatch_barrier_async(self.routeMapsModificationQueue, ^{
        NSMutableDictionary *subrouter   = [self addRouters:url];
        subrouter[_FCRouterMatchContent] = VCClass;
        subrouter[_FCRouterMatchType]    = @(FCRouterMatchTypeClass);
    });
}

- (void)regsiterUrl:(NSString *)url mapHandle:(FCRouterHandle)handle {
    dispatch_barrier_async(self.routeMapsModificationQueue, ^{
        NSMutableDictionary *subrouter   = [self addRouters:url];
        subrouter[_FCRouterMatchContent] = handle;
        subrouter[_FCRouterMatchType]    = @(FCRouterMatchTypeHandle);
    });
}

- (UIViewController *)matchViewControllerWithUrl:(NSString *)url {
    return [self matchViewControllerWithUrl:url userInfo:nil];
}

- (UIViewController *)matchViewControllerWithUrl:(NSString *)url userInfo:(NSDictionary *)userInfo {
    __block UIViewController *viewController = nil;
    dispatch_sync(self.routeMapsModificationQueue, ^{
        NSMutableDictionary *subrouter          = [self subRouters:url];
        if ([subrouter[_FCRouterMatchType] integerValue] == FCRouterMatchTypeClass) {
            [subrouter addEntriesFromDictionary:userInfo];
            Class vcClass                       = subrouter[_FCRouterMatchContent];
            viewController    = [vcClass new];
            viewController.routerParamters      = FCRouterCustomParamters(subrouter, url);
        }
    });
    return viewController;
}

- (id)matchHandleWithUrl:(NSString *)url userInfo:(NSDictionary *)userInfo {
    __block id value = nil;
    dispatch_sync(self.routeMapsModificationQueue, ^{
        NSMutableDictionary *subrouter          = [self subRouters:url];
        if ([subrouter[_FCRouterMatchType] integerValue] == FCRouterMatchTypeHandle) {
            FCRouterHandle handle               = subrouter[_FCRouterMatchContent];
            [subrouter addEntriesFromDictionary:userInfo];
            @autoreleasepool {
                value                           = handle(FCRouterCustomParamters(subrouter, url));
            }
        }
    });
    return value;
}

- (id)matchHandleWithUrl:(NSString *)url {
    return [self matchHandleWithUrl:url userInfo:nil];
}

+ (BOOL)canOpenUrl:(NSString *)url {
    return [[self share] p_matchTypeWithUrl:url] != FCRouterMatchTypeNone;
}

- (UIViewController *)openUrl:(NSString *)url {
    __block UIViewController *viewController = nil;
    dispatch_sync(self.routeMapsModificationQueue, ^{
        NSMutableDictionary *subrouter          = [self subRouters:url];
        if ([subrouter[_FCRouterMatchType] integerValue] == FCRouterMatchTypeClass) {
            Class vcClass                       = subrouter[_FCRouterMatchContent];
            viewController    = [vcClass new];
            viewController.routerParamters      = FCRouterCustomParamters(subrouter, url);
        }
    });
    return viewController;
}

- (NSMutableDictionary *)addRouters:(NSString *)url {
    NSArray *array                          = [self pathcomponentsWithUrl:url];
    NSMutableDictionary *subRouter          = self.routerMaps;
    for (NSString *path in array) {
        if (!subRouter[path]) {
            subRouter[path]                 = [NSMutableDictionary dictionary];
        }
        subRouter                           = subRouter[path];
    }
    return subRouter;
}

- (NSMutableDictionary *)subRouters:(NSString *)url {
    NSArray *array                          = [self pathcomponentsWithUrl:url];
    NSMutableDictionary *subRouter          = self.routerMaps;
    NSMutableDictionary *extMap             = @{}.mutableCopy;
    for (NSString *path in array) {
        for (NSString *key in subRouter.allKeys) {
            if (subRouter[path]) {
                subRouter = subRouter[path];
                break;
            }
            else if ([key hasPrefix:@":"]) {
                subRouter = subRouter[key];
                extMap[[key substringFromIndex:1]] = path;
                break;
            }
            else {
                subRouter = subRouter[path];
            }
        }
        if (!subRouter) {
            return nil;
        }
    }
    // 拼接一下自定义的
    [subRouter addEntriesFromDictionary:extMap];
    return subRouter.mutableCopy;
}

- (FCRouterMatchType)p_matchTypeWithUrl:(NSString *)url {
    __block FCRouterMatchType type;
    dispatch_sync(self.routeMapsModificationQueue, ^{
        NSMutableDictionary *subrouter = [self subRouters:url];
         type = [subrouter[_FCRouterMatchType] integerValue];
    });
    return type;
}

- (NSArray<NSString *> *)pathcomponentsWithUrl:(NSString *)url {
    if (![NSURL URLWithString:url]) {
        return nil;
    }
    NSMutableArray *pathCompoments = [NSMutableArray array];
    for (NSString *pathCompoment in [NSURL URLWithString:url].pathComponents) {
        if ([pathCompoment isEqualToString:@"/"]) continue;
        if ([[pathCompoment substringToIndex:1] isEqualToString:@"?"]) break;
        [pathCompoments addObject:pathCompoment];
    }
    [pathCompoments insertObject:[NSURL URLWithString:url].scheme atIndex:0];
    [pathCompoments insertObject:[NSURL URLWithString:url].host atIndex:1];
    return pathCompoments.copy;
}

@end

@implementation UIViewController (FCRouter)

static char FCRouterParamtersKey;

- (void)setRouterParamters:(NSDictionary *)routerParamters {
    objc_setAssociatedObject(self, &FCRouterParamtersKey, routerParamters, OBJC_ASSOCIATION_RETAIN);
}

- (NSDictionary *)routerParamters {
    return objc_getAssociatedObject(self, &FCRouterParamtersKey);
}

@end
