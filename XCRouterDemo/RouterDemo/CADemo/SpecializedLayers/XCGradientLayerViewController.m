//
//  XCGradientLayerViewController.m
//  CADemo
//
//  Created by Alexcai on 2019/1/17.
//  Copyright © 2019 dongjiu. All rights reserved.
//

#import "XCGradientLayerViewController.h"

@interface XCGradientLayerViewController ()

@end

@implementation XCGradientLayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = NSStringFromClass(self.class);
    self.view.backgroundColor = UIColor.whiteColor;
    [self multipartGradientLayer];
    [self gradientLayerDemo];
}

- (void)gradientLayerDemo{
    CAGradientLayer *gdLayer = [CAGradientLayer layer];
    gdLayer.colors = @[(__bridge id)UIColor.redColor.CGColor,(__bridge id)UIColor.blueColor.CGColor];
    gdLayer.startPoint = CGPointMake(0.5, 0.5);
    gdLayer.frame = CGRectMake(20, 100, 100, 50);
    [self.view.layer addSublayer:gdLayer];
}

- (void)multipartGradientLayer{
    CAGradientLayer *gradLayer = [CAGradientLayer layer];
    gradLayer.frame = CGRectMake(150, 100, 100, 100);
    [self.view.layer addSublayer:gradLayer];
    gradLayer.colors = @[(__bridge id)UIColor.redColor.CGColor,
                         (__bridge id)UIColor.blueColor.CGColor,
                         (__bridge id)UIColor.greenColor.CGColor];
    gradLayer.startPoint = CGPointZero;
    gradLayer.endPoint = CGPointMake(1,1);
    gradLayer.locations = @[@0.0, @0.25, @0.5];
}
@end
