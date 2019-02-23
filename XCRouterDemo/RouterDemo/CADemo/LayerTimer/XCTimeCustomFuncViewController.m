//
//  XCTimeCustomFuncViewController.m
//  CADemo
//
//  Created by Alexcai on 2019/2/22.
//  Copyright © 2019 dongjiu. All rights reserved.
//

#import "XCTimeCustomFuncViewController.h"

@interface XCTimeCustomFuncViewController ()

@end

@implementation XCTimeCustomFuncViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self customEasingFuncDemo];
}

- (void)customEasingFuncDemo{
    CAMediaTimingFunction *fn = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    float ctrp1[2],ctrp2[2];
    [fn getControlPointAtIndex:1 values:ctrp1];
    [fn getControlPointAtIndex:2 values:ctrp2];
    
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointZero];
    [path addCurveToPoint:(CGPoint){1,1} controlPoint1:(CGPoint){ctrp1[0],ctrp1[1]} controlPoint2:(CGPoint){ctrp2[0],ctrp2[1]}];
    [path applyTransform:CGAffineTransformMakeScale(200, 200)];
    
    
    CALayer *cl = [CALayer layer];
    cl.frame = (CGRect){10,100,300,300};
    [self.view.layer addSublayer:cl];
    cl.geometryFlipped = YES;
    
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.path = path.CGPath;
    layer.lineWidth = 4;
    layer.strokeColor = UIColor.redColor.CGColor;
    layer.fillColor = UIColor.clearColor.CGColor;
    [cl addSublayer:layer];

}

@end
