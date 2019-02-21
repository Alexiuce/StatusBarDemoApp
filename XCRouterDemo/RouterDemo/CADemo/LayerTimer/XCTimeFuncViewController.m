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

@property (nonatomic, weak) UIView *colorView;

@end

@implementation XCTimeFuncViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self timingFuncDemo];
    
    UIView *v = [[UIView alloc]initWithFrame:(CGRect){100,100,100,100}];
    v.backgroundColor = UIColor.greenColor;
    [self.view addSubview:v];
    self.colorView = v;
}

//- (void)viewDidAppear:(BOOL)animated{
//    [super viewDidAppear:animated];
//    [self viewKeyAnimation];
//}

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
    
    
//    [UIView animateKeyframesWithDuration:3.0 delay:0 options:UIViewKeyframeAnimationOptionAutoreverse animations:^{
//         self.colorLayer.position = [touches.anyObject locationInView:self.view];
//    } completion:nil];
    
    [UIView animateWithDuration:3.0 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
         self.colorLayer.position = [touches.anyObject locationInView:self.view];
         self.colorView.center =  [touches.anyObject locationInView:self.view];
    } completion:nil];
//    [self viewKeyAnimation];
    
}

- (void)viewKeyAnimation{
    [UIView animateKeyframesWithDuration:5.0 delay:0 options:UIViewKeyframeAnimationOptionCalculationModeLinear animations:^{
        [UIView addKeyframeWithRelativeStartTime:0.0 relativeDuration:0.5 animations:^{
            self.colorLayer.position = (CGPoint){100,200};
            self.colorView.center =  (CGPoint){100,200};
        }];
//        [UIView addKeyframeWithRelativeStartTime:0.5 relativeDuration:0.5 animations:^{
//            self.colorLayer.position = (CGPoint){340,200};
//        }];
//        [UIView addKeyframeWithRelativeStartTime:0.75 relativeDuration:0.25 animations:^{
//            self.colorLayer.position = (CGPoint){340,500};
//        }];
    } completion:^(BOOL finished) {
        NSLog(@"key animation finished");
    }];
}
@end
