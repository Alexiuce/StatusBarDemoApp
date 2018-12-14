//
//  ViewController.m
//  CADemo
//
//  Created by Alexcai on 2018/12/4.
//  Copyright © 2018 dongjiu. All rights reserved.
//

#import "ViewController.h"

#import "XCViewModel.h"


#define MYNUMBER 10

%:define MYNEWNUMBER 20


@interface Spark : NSObject

@property(nonatomic,copy) NSString *name;

@end

@implementation Spark

- (void)speak {
    NSLog(@"My name is:%@",self.name);
}

@end

/** c89 中 如果函数的返回值为int 类型,可以省略不写 */
//my_function(){
//    return 20;
//}


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (nonatomic, strong) CALayer *redLayer;

@property (nonatomic, strong) UIBezierPath *path;
@property (nonatomic, strong) CALayer *moveLayer;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UILabel *timeOffsetLabel;
@property (weak, nonatomic) IBOutlet UILabel *speedLabel;

@end

@implementation ViewController

- (void)viewDidLoad <%
    [super viewDidLoad];
    
    int 哈哈 = 20;
    NSString *😀 = @"empty";

    NSLog(@"%@",😀);
    NSLog(@"%d",MYNEWNUMBER);
//    [self p_setupBezierPath];
    // 获取系统最后一次重启后到当前的时间秒数;
//    CFTimeInterval time = CACurrentMediaTime();
//    NSLog(@"time = %f",time);
    <:self p_graphCAMediaTimingFunc:>;
//    [self p_shareLayer];
   
//    [self p_objcDemo];
    
%>

- (void)p_objcDemo{
    
//    char *a = "a";
//    char *b = "b";
//    char *c = "f";
//    NSLog(@"%d == %d == %d",a[4],*b,*c);
    
    NSString *a = @"Hello~";
    id cls = [Spark class];

//    NSLog(@"%p  %p",a,cls);
    void *obj = &cls;
//    NSLog(@"%p, %p",&cls,self);

    [(__bridge id)obj speak];
}

- (void)p_shareLayer{
    CAShapeLayer *blueLayer = [CAShapeLayer layer];
//    blueLayer.frame = CGRectMake(50, 50, 200, 200);
    blueLayer.position = CGPointMake(50, 50);
    blueLayer.fillColor = UIColor.blueColor.CGColor;
//    blueLayer.backgroundColor = UIColor.redColor.CGColor;
    blueLayer.path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 100, 100) cornerRadius:20].CGPath;
    [self.containerView.layer addSublayer:blueLayer];
}

- (IBAction)playAnimationDemo:(UIButton *)sender{
    /** 创建关键帧动画 */
    CAKeyframeAnimation *keyAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    keyAnimation.duration = 4.0f;
    keyAnimation.timeOffset = self.timeOffsetLabel.text.doubleValue;
    keyAnimation.speed = self.speedLabel.text.doubleValue;
    keyAnimation.path = self.path.CGPath;
    keyAnimation.rotationMode = kCAAnimationRotateAuto;
    [self.moveLayer addAnimation:keyAnimation forKey:nil];
    
}

- (IBAction)changedTimeOffset:(UISlider *)sender {
    self.timeOffsetLabel.text = [NSString stringWithFormat:@"%.1f",sender.value];
}


- (IBAction)changedSpeed:(UISlider *)sender {
    self.speedLabel.text = [NSString stringWithFormat:@"%.1f",sender.value];
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
    
    [self p_transitionDemo];
   
    
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
    /** 创建关键帧动画 */
    CAKeyframeAnimation *keyAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    keyAnimation.duration = 4.0f;
    keyAnimation.path = self.path.CGPath;
    keyAnimation.rotationMode = kCAAnimationRotateAuto;
    [self.moveLayer addAnimation:keyAnimation forKey:nil];
    
}

- (void)p_transitionDemo{
    NSArray *imageNames = @[@"icon_shangfen",@"icon_lianmeng"];
    static int index = 0;
    CATransition *transition = [CATransition animation];
    /**
     kCATransitionFade
     kCATransitionMoveIn
     kCATransitionPush
     kCATransitionReveal
     ---- 私有效果 -------
     pageCurl 向上翻一页
     pageUnCurl 向下翻一页
     rippleEffect 滴水效果
     suckEffect 收缩效果,如一块布被抽走
     cube 立方体效果
     oglFlip
     */
    transition.type = @"oglFlip";
    
    /**
     top,left,right,bottom;
     */
    transition.subtype = kCATransitionFromLeft;
    
    [self.imageView.layer addAnimation:transition forKey:nil];
    
//    self.imageView.image = [UIImage imageNamed:imageNames[index % 2]];
    self.imageView.image = [UIImage imageNamed:imageNames[0]];
    index++;
    
}
- (void)p_test{
    //    [self p_setupBezierPath];
    
    //add the ship
    CALayer *shipLayer = [CALayer layer];
    shipLayer.frame = CGRectMake(0, 0, 128, 128);
    shipLayer.position = CGPointMake(150, 150);
    shipLayer.contents = (__bridge id)[UIImage imageNamed:@"ship"].CGImage;
    [self.containerView.layer addSublayer:shipLayer];
    //animate the ship rotation
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"transform.rotation";
    animation.duration = 2.0;
    //    animation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI, 0, 0, 1)];
    animation.byValue = @(M_PI * 2); //[NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI, 0, 0, 1)];
    [shipLayer addAnimation:animation forKey:nil];
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

- (void)p_graphCAMediaTimingFunc{


    //create timing function
    CAMediaTimingFunction *function = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    
    //get control points
    float controlPoint1[2], controlPoint2[2];
    [function getControlPointAtIndex:1 values:controlPoint1];
    [function getControlPointAtIndex:2 values:controlPoint2];
    //create curve
    UIBezierPath *path = [[UIBezierPath alloc] init];
    [path moveToPoint:CGPointZero];

    CGPoint cp1 = CGPointMake(controlPoint1[0], controlPoint1[1]);
    CGPoint cp2 = CGPointMake(controlPoint2[0], controlPoint2[1]);
    [path addCurveToPoint:CGPointMake(1, 1) controlPoint1:cp1 controlPoint2:cp2];
    //scale the path up to a reasonable size for display
    [path applyTransform:CGAffineTransformMakeScale(200, 200)];
    //create shape layer
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.strokeColor = [UIColor redColor].CGColor;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.lineWidth = 4.0f;
    shapeLayer.path = path.CGPath;
    [self.containerView.layer addSublayer:shapeLayer];
    //flip geometry so that 0,0 is in the bottom-left
    self.containerView.layer.geometryFlipped = YES;
}

@end


