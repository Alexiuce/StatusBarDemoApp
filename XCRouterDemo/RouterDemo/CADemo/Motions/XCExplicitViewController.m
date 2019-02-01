//
//  XCExplicitViewController.m
//  CADemo
//
//  Created by Alexcai on 2019/1/31.
//  Copyright © 2019 dongjiu. All rights reserved.
//

#import "XCExplicitViewController.h"

@interface XCExplicitViewController ()<CAAnimationDelegate>

@end

@implementation XCExplicitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = NSStringFromClass(self.class);
    self.view.backgroundColor = UIColor.whiteColor;
    [self basicAnimationDemo];
}

- (void)basicAnimationDemo{
    CALayer *layer = [CALayer layer];
    layer.frame = (CGRect){30,130,100,50};
    layer.backgroundColor = UIColor.redColor.CGColor;
    layer.anchorPoint = CGPointZero;
    [self.view.layer addSublayer:layer];
    
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.delegate = self;
    animation.keyPath = @"position.y";
    animation.toValue = @(400);
    animation.duration = 3.0f;
    [layer addAnimation:animation forKey:nil];
    
    
}

#pragma mark CAAnimationDelegate
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    if (flag) {
        NSLog(@"animation finished %@",anim);
        
    }
}

@end
