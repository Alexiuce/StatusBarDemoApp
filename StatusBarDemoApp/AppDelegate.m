//
//  AppDelegate.m
//  StatusBarDemoApp
//
//  Created by Alexcai on 2016/11/10.
//  Copyright © 2016年 codeMaster. All rights reserved.
//

#import "AppDelegate.h"
#import "SBPopViewController.h"

@interface AppDelegate ()
@property (nonatomic ,strong) NSStatusItem *demoItem;     // 添加状态item属性
@property (nonatomic, strong) NSPopover *popover;   // 弹窗
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    
    NSStatusBar *sb = [NSStatusBar systemStatusBar];
    
    
   
    
    // 创建NSStatusItem并添加到系统状态栏上
    self.demoItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSSquareStatusItemLength];
    
    
    
    NSNumber *n = [self.demoItem valueForKey:@"_fPriority"];
    NSLog(@"before = %d",n.intValue);
    
//    [self.demoItem setValue:@(INT_MAX) forKey:@"_fPriority"];
     NSNumber *n1 = [self.demoItem valueForKey:@"_fPriority"];
    NSLog(@"after = %d",n1.intValue);
    // 设置NSStatusItem 的图片
    NSImage *image = [NSImage imageNamed:@"settings"];
    [self.demoItem.button setImage: image];
    
    // 创建popover，并设置
    _popover = [[NSPopover alloc]init];
    _popover.behavior = NSPopoverBehaviorTransient;
    _popover.appearance = [NSAppearance appearanceNamed:NSAppearanceNameVibrantLight];
    _popover.contentViewController = [[SBPopViewController alloc]initWithNibName:@"SBPopViewController" bundle:nil];
    
    // 为NSStatusItem 添加点击事件
    self.demoItem.target = self;
    self.demoItem.button.action = @selector(showMyPopover:);
   
    // 防止下面的block方法中造成循环引用
    __weak typeof (self) weakSelf = self;
    // 添加对鼠标左键进行事件监听
    // 如果想对其他事件监听也进行监听，可以修改第一个枚举参数： NSEventMaskLeftMouseDown | 你要监听的其他枚举值
    [NSEvent addGlobalMonitorForEventsMatchingMask:NSEventMaskLeftMouseDown handler:^(NSEvent * event) {
        if (weakSelf.popover.isShown) {
            // 关闭popover；
            [weakSelf.popover close];
        }
    }];
    
    NSArray *is = [sb valueForKeyPath:@"items"];
    NSLog(@"%zd",is.count);
}
// 显示popover方法
- (void)showMyPopover:(NSStatusBarButton *)button{
    [_popover showRelativeToRect:button.bounds ofView:button preferredEdge:NSRectEdgeMaxY];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
