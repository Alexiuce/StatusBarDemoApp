//
//  ViewController.m
//  CADemo
//
//  Created by Alexcai on 2018/12/4.
//  Copyright © 2018 dongjiu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (nonatomic, strong) CALayer *redLayer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.redLayer = [CALayer layer];
    self.redLayer.frame = CGRectInset(self.containerView.bounds, 30, 80);
    self.redLayer.backgroundColor = UIColor.redColor.CGColor;
    [self.containerView.layer addSublayer:self.redLayer];
    /** 隐式动画的转换效果 */
//    CATransition *transition = [CATransition animation];
//    transition.type = kCATransitionReveal;
//    transition.subtype = kCATransitionFromLeft;
//    self.redLayer.actions = @{@"backgroundColor":transition};
    
    
}

- (IBAction)clickChangeColorButton:(UIButton *)sender {
    
//    [CATransaction begin];
//    [CATransaction setAnimationDuration:5.0];
    
//    CGFloat red = arc4random() /(CGFloat) INT_MAX;
//    CGFloat green = arc4random() / (CGFloat) INT_MAX;
//    CGFloat blue = arc4random() / (CGFloat) INT_MAX;
//    UIColor *color = [UIColor colorWithRed:red green:green blue:blue alpha:1];
    /** 1. CABasicAnimation */
//    CABasicAnimation *a1 = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
//    a1.toValue = (__bridge id)color.CGColor;
//    [self.redLayer addAnimation:a1 forKey:nil];
    
    
    /** 2. Keyframe Animation */
    CAKeyframeAnimation *ka = [CAKeyframeAnimation animationWithKeyPath:@"backgroundColor"];
    ka.duration = 2.0;
    ka.values = @[(__bridge id)UIColor.redColor.CGColor,
                  (__bridge id)UIColor.blueColor.CGColor,
                  (__bridge id)UIColor.yellowColor.CGColor,
                  (__bridge id)UIColor.redColor.CGColor,
                  ];
    
    [self.redLayer addAnimation:ka forKey:nil];
//    self.redLayer.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1].CGColor;
    
//    [CATransaction commit];
}

/** UIView transaction */
- (IBAction)clickChangeFrameButton:(UIButton *)sender {
    
    [UIView beginAnimations:@"" context:nil];
    [UIView setAnimationDuration:5.0];
    
    CGFloat x = self.containerView.frame.origin.x;
    CGFloat y = self.containerView.frame.origin.y;
    CGFloat w = arc4random_uniform(30) + 20;
    CGFloat h = arc4random_uniform(30) + 30;
    
    self.containerView.frame = CGRectMake(x, y, w, h);
    [UIView commitAnimations];
    
}

@end
