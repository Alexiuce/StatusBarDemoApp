//
//  XCTimeFuncViewController.m
//  CADemo
//
//  Created by Alexcai on 2019/2/20.
//  Copyright © 2019 dongjiu. All rights reserved.
//

#import "XCTimeFuncViewController.h"

@interface XCTimeFuncViewController ()

@property (nonatomic, weak) CALayer *colorLayer;

@end

@implementation XCTimeFuncViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self timingFuncDemo];
}

- (void)timingFuncDemo{
    CALayer *layer = [CALayer layer];
    layer.frame = (CGRect){16,100,50,50};
    layer.backgroundColor = UIColor.redColor.CGColor;
    [self.view.layer addSublayer:layer];
    self.colorLayer = layer;
}


#pragma mark - UITouch

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    [CATransaction begin];
//    [CATransaction setAnimationDuration:1.0];
//    CAMediaTimingFunction *func = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
//    [CATransaction setAnimationTimingFunction:func];
//    self.colorLayer.position = [touches.anyObject locationInView:self.view];
//
//    [CATransaction commit];
    
    
    [UIView animateKeyframesWithDuration:1.0 delay:0 options:UIViewKeyframeAnimationOptionAutoreverse animations:^{
         self.colorLayer.position = [touches.anyObject locationInView:self.view];
    } completion:nil];
    
}
@end
