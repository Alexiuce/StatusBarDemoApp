//
//  XCRunloopManager.m
//  RouterDemo
//
//  Created by Alexcai on 2018/11/29.
//  Copyright © 2018 dongjiu. All rights reserved.
//

#import "XCRunloopManager.h"

@implementation XCRunloopManager



+ (void)addRunloopObserver{
    /**
     kCFRunLoopEntry   ==   1 进入runloop ,
     kCFRunLoopBeforeTimers == 2   即将处理Timer,
     kCFRunLoopBeforeSources == 4 即将处理source,
     kCFRunLoopBeforeWaiting  == 32 即将开始休眠,
     kCFRunLoopAfterWaiting == 64 从休眠唤醒,
     kCFRunLoopExit = 128   退出runloop,
     kCFRunLoopAllActivities  所有状态;
     */
    
    //  创建observer
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
}

@end
