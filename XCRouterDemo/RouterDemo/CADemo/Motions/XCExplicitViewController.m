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
    [self keyFrameAnimationDemo];
}

- (void)basicAnimationDemo{
    CALayer *layer = [CALayer layer];
    layer.frame = (CGRect){30,130,100,50};
    layer.backgroundColor = UIColor.redColor.CGColor;
    layer.anchorPoint = CGPointZero;
    [self.view.layer addSublayer:layer];
    
    CABasicAnimation *animation = [CABasicAnimation animation];
    NSLog(@"create animation %@",animation);
    animation.delegate = self;
    animation.keyPath = @"position.y";
    animation.toValue = @(400);
    animation.duration = 3.0f;
    [layer addAnimation:animation forKey:nil];
    
    
}

- (void)keyFrameAnimationDemo{
    CATextLayer *colorLayer = [CATextLayer layer];
    colorLayer.frame = (CGRect){180,130, 100,50};
    colorLayer.string = @"Color Layer";
    [self.view.layer addSublayer:colorLayer];
    
    CAKeyframeAnimation *keyAnimation = [CAKeyframeAnimation animation];
    keyAnimation.keyPath = @"backgroundColor";
    keyAnimation.duration = 3.0;
    keyAnimation.values = @[(__bridge id)UIColor.blueColor.CGColor,
                            (__bridge id)UIColor.redColor.CGColor,
                            (__bridge id)UIColor.yellowColor.CGColor,
                            (__bridge id)UIColor.blueColor.CGColor
                            ];
    
    
    [colorLayer addAnimation:keyAnimation forKey:nil];
    
    
}

#pragma mark CAAnimationDelegate
/** anim 与layer 的animation 不是同一个对象: 代理方法中anim 是layer animation 的一个不可变copy */
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    if (flag) {
        NSLog(@"animation finished %@",anim);
        
    }
}

@end
