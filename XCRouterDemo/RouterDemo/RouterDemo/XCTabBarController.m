//
//  XCTabBarController.m
//  RouterDemo
//
//  Created by Alexcai on 2018/12/7.
//  Copyright © 2018 dongjiu. All rights reserved.
//

#import "XCTabBarController.h"

@interface XCTabBarController ()



@end

@implementation XCTabBarController

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    NSLog(@"%@",item);
    CATransition *transition = [CATransition animation];
    transition.type = kCATransitionPush;
    transition.subtype = kCATransitionFromLeft;

    [self.view.layer addAnimation:transition forKey:nil];
}

@end
