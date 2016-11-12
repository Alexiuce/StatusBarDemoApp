//
//  ViewController.m
//  StatusBarDemoApp
//
//  Created by Alexcai on 2016/11/10.
//  Copyright © 2016年 codeMaster. All rights reserved.
//

#import "ViewController.h"
#import <AppKit/AppKit.h>

#import "SBPopViewController.h"

@interface ViewController ()

@property (nonatomic ,strong) NSStatusItem *demoItem;     // 添加状态item属性
@property (nonatomic, strong) NSPopover *popover;   // 弹窗

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 创建NSStatusItem并添加到系统状态栏上
    self.demoItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    // 设置NSStatusItem 的图片
    NSImage *image = [NSImage imageNamed:@"settings"];
    [self.demoItem.button setImage: image];
    
    // 创建popover
    _popover = [[NSPopover alloc]init];
    _popover.behavior = NSPopoverBehaviorTransient;
    _popover.appearance = [NSAppearance appearanceNamed:NSAppearanceNameVibrantLight];
    
    _popover.contentViewController = [[SBPopViewController alloc]initWithNibName:@"SBPopViewController" bundle:nil];
    
    // 为NSStatusItem 添加点击事件
    self.demoItem.target = self;
    self.demoItem.button.action = @selector(showMyPopover:);
}
// 显示popover方法
- (void)showMyPopover:(NSStatusBarButton *)button{
    [_popover showRelativeToRect:button.bounds ofView:button preferredEdge:NSRectEdgeMaxY];
}

@end
