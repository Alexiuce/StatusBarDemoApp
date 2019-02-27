//
//  XCTimeCustomFuncViewController.m
//  CADemo
//
//  Created by Alexcai on 2019/2/22.
//  Copyright © 2019 dongjiu. All rights reserved.
//

#import "XCTimeCustomFuncViewController.h"

@interface XCTimeCustomFuncViewController ()

@property (nonatomic, weak) UIView *ballView;

@end

@implementation XCTimeCustomFuncViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *view = [[UIView alloc]initWithFrame:(CGRect){200,300,50,50}];
    view.backgroundColor = UIColor.redColor;
    view.layer.cornerRadius = 25;
    view.layer.masksToBounds = YES;
    [self.view addSubview:view];
    self.ballView = view;
    
    // Do any additional setup after loading the view from its nib.
    [self customEasingFuncDemo];
    [self keyAnimationFunctionDemo];
}

- (void)customEasingFuncDemo{
//    CAMediaTimingFunction *fn = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    /**  Creates a timing function modelled on a cubic Bezier curve. The end
     * points of the curve are at (0,0) and (1,1), the two points 'c1' and
     * 'c2' defined by the class instance are the control points. Thus the
     * points defining the Bezier curve are: '[(0,0), c1, c2, (1,1)]'
    + (instancetype)functionWithControlPoints:(float)c1x :(float)c1y :(float)c2x :(float)c2y
     */
    CAMediaTimingFunction *fn = [CAMediaTimingFunction functionWithControlPoints:1 :0 :0.75 :1];
    float ctrp1[2],ctrp2[2];
    [fn getControlPointAtIndex:1 values:ctrp1];
    [fn getControlPointAtIndex:2 values:ctrp2];
    
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointZero];
    [path addCurveToPoint:(CGPoint){1,1} controlPoint1:(CGPoint){ctrp1[0],ctrp1[1]} controlPoint2:(CGPoint){ctrp2[0],ctrp2[1]}];
    [path applyTransform:CGAffineTransformMakeScale(200, 200)];
    
    
    CALayer *cl = [CALayer layer];
    cl.backgroundColor = UIColor.lightGrayColor.CGColor;
    cl.frame = (CGRect){10,400,200,200};
    [self.view.layer addSublayer:cl];
    cl.geometryFlipped = YES;
    
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.path = path.CGPath;
    layer.lineWidth = 4;
    layer.strokeColor = UIColor.redColor.CGColor;
    layer.fillColor = UIColor.clearColor.CGColor;
    [cl addSublayer:layer];

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self keyAnimationFunctionDemo];
}

- (void)keyAnimationFunctionDemo{
//    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
//    animation.keyPath = @"position";
//    animation.duration = 2.0;
//    animation.values = @[
//                         [NSValue valueWithCGPoint:(CGPoint){100,300}],
//                         [NSValue valueWithCGPoint:(CGPoint){100,500}],
//                         [NSValue valueWithCGPoint:(CGPoint){100,350}],
//                         [NSValue valueWithCGPoint:(CGPoint){100,500}],
//                         [NSValue valueWithCGPoint:(CGPoint){100,400}],
//                         [NSValue valueWithCGPoint:(CGPoint){100,500}],
//                         [NSValue valueWithCGPoint:(CGPoint){100,450}],
//                         [NSValue valueWithCGPoint:(CGPoint){100,500}],
//                         ];
//    animation.timingFunctions = @[
//                                 [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn],
//                                 [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut],
//                                 [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn],
//                                 [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut],
//                                 [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn],
//                                 [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut],
//                                 [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn],
//                                 [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut],
//                                 ];
//    animation.keyTimes = @[@(0.0),@(0.3),@(5.0),@(0.7),@(0.8),@(0.9),@(0.95),@(1.0)];
//
//
//
//    [self.ballView.layer addAnimation:animation forKey:nil];
    
    self.ballView.center = CGPointMake(150, 32);
    
    //create keyframe animation
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position";
    animation.duration = 1.0;
    animation.values = @[[NSValue valueWithCGPoint:CGPointMake(150, 32)],
                        [NSValue valueWithCGPoint:CGPointMake(150, 268)],
                        [NSValue valueWithCGPoint:CGPointMake(150, 140)],
                         [NSValue valueWithCGPoint:CGPointMake(150, 268)],
                         [NSValue valueWithCGPoint:CGPointMake(150, 220)],
                         [NSValue valueWithCGPoint:CGPointMake(150, 268)],
                         [NSValue valueWithCGPoint:CGPointMake(150, 250)],
                         [NSValue valueWithCGPoint:CGPointMake(150, 268)]];
    animation.timingFunctions = @[
                                  [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn],
                                  [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut],
                                  [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn],
                                  [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut],
                                  [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn],
                                  [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut],
                                  [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]
                                  ];
    animation.keyTimes = @[@0.0, @0.3, @0.5, @0.7, @0.8, @0.9, @0.95, @1.0];
    

    //apply animation
    self.ballView.layer.position = CGPointMake(150, 268);
    [self.ballView.layer addAnimation:animation forKey:nil];
    
}

@end
