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

@property (nonatomic, strong) UIBezierPath *path;
@property (nonatomic, strong) CALayer *moveLayer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self p_setupBezierPath];
    
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
    
   /** 创建关键帧动画 */
    CAKeyframeAnimation *keyAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    keyAnimation.duration = 4.0f;
    keyAnimation.path = self.path.CGPath;
    keyAnimation.rotationMode = kCAAnimationRotateAuto;
    [self.moveLayer addAnimation:keyAnimation forKey:nil];
    
}

- (void)p_setupBezierPath{
    /** 1. 添加路径 */
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, 150)];
    [path addCurveToPoint:CGPointMake(300, 150) controlPoint1:CGPointMake(75, 0) controlPoint2:CGPointMake(225, 300)];
    _path = path;
    /** 2. 添加CAShaperLayer */
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.path = path.CGPath;
    layer.fillColor = UIColor.clearColor.CGColor;
    layer.strokeColor = UIColor.redColor.CGColor;
    layer.lineWidth = 3.0f;
    [self.containerView.layer addSublayer:layer];
    /** 3. 添加运动Layer */
    CALayer *moveLayer = [CALayer layer];
    moveLayer.frame = CGRectMake(0, 150, 64, 64);
    moveLayer.position = CGPointMake(0, 150);
    moveLayer.anchorPoint = CGPointMake(0, 0.5);
    moveLayer.contents = (__bridge id)[UIImage imageNamed:@"ship"].CGImage;
    [self.containerView.layer addSublayer:moveLayer];
    _moveLayer = moveLayer;
    
}

- (void)p_setupUI{
    self.redLayer = [CALayer layer];
    self.redLayer.frame = CGRectInset(self.containerView.bounds, 30, 80);
    self.redLayer.backgroundColor = UIColor.redColor.CGColor;
    [self.containerView.layer addSublayer:self.redLayer];
    /** 隐式动画的转换效果 */
    CATransition *transition = [CATransition animation];
    transition.type = kCATransitionReveal;
    transition.subtype = kCATransitionFromLeft;
    self.redLayer.actions = @{@"backgroundColor":transition};
}

- (void)p_keyFrameDemo{
    
}

- (void)p_viewAnimation{
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
