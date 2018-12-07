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
    NSUInteger selectedIndex = self.selectedIndex;
    CATransition *transition = [CATransition animation];
    transition.type = kCATransitionPush;
    if (selectedIndex == 1) {
        transition.subtype = kCATransitionFromLeft;
    }else{
        transition.subtype = kCATransitionFromRight;
    }

    [self.view.layer addAnimation:transition forKey:nil];
}

@end
