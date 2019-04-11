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

#import <Foundation/Foundation.h>
#import <UIKit/UIViewController.h>

typedef id(^FCRouterHandle)(NSDictionary *paramters);
FOUNDATION_EXPORT NSString *FCRouterKey;

@interface UIViewController (FCRouter)

@property (nonatomic, strong) NSDictionary *routerParamters;

@end

@interface FCRouter : NSObject

+ (instancetype)share;

- (void)regsiterPlistPathForSource:(NSString *)source bundle:(NSBundle *)bundle;

- (void)regsiterUrl:(NSString *)url mapViewControllerClass:(Class)VCClass;

- (void)regsiterUrl:(NSString *)url mapHandle:(FCRouterHandle)handle;

- (UIViewController *)matchViewControllerWithUrl:(NSString *)url;

- (UIViewController *)matchViewControllerWithUrl:(NSString *)url userInfo:(NSDictionary *)userInfo;

- (UIViewController *)openUrl:(NSString *)url;

- (id)matchHandleWithUrl:(NSString *)url;

- (id)matchHandleWithUrl:(NSString *)url userInfo:(NSDictionary *)userInfo;

+ (BOOL)canOpenUrl:(NSString *)url;

@end
