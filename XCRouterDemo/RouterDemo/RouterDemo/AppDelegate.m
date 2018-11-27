//
//  AppDelegate.m
//  RouterDemo
//
//  Created by Alexcai on 2018/11/23.
//  Copyright © 2018 dongjiu. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    /**
     kCFRunLoopEntry   ==   1 进入runloop ,
     kCFRunLoopBeforeTimers == 2   即将处理Timer,
     kCFRunLoopBeforeSources == 4 即将处理source,
     kCFRunLoopBeforeWaiting  == 32 即将开始休眠,
     kCFRunLoopAfterWaiting == 64 从休眠唤醒,
     kCFRunLoopExit = 128   退出runloop,
     kCFRunLoopAllActivities  所有状态;
     */
    
    // 创建observer
    CFRunLoopObserverRef observer = CFRunLoopObserverCreateWithHandler(CFAllocatorGetDefault(), kCFRunLoopAllActivities, YES, 0, ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity) {
        
        switch (activity) {
            case kCFRunLoopEntry:{
                NSLog(@"----进入runloop---");
                break;
            }
            case kCFRunLoopBeforeTimers:{
                NSLog(@"---- runloop准备处理Timer ---");
                break;
            }
            case kCFRunLoopBeforeSources:{
                NSLog(@"---- runloop准备处理Source ---");
                break;
            }
            case kCFRunLoopBeforeWaiting:{
                NSLog(@"---- runloop即将进入休眠 ---");
                break;
            }
            case kCFRunLoopAfterWaiting:{
                NSLog(@"---- runloop从休眠中唤醒 ---");
                break;
            }
            default:
                break;
        }
        
    });
    
    // 添加观察者：监听RunLoop的状态
    CFRunLoopAddObserver(CFRunLoopGetCurrent(), observer, kCFRunLoopDefaultMode);
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
