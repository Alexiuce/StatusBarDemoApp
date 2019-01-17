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
    [self gradientLayerDemo];
}

- (void)gradientLayerDemo{
    CAGradientLayer *gdLayer = [CAGradientLayer layer];
    gdLayer.colors = @[(__bridge id)UIColor.redColor.CGColor,(__bridge id)UIColor.blueColor.CGColor];
    gdLayer.startPoint = CGPointMake(0.5, 0.5);
    gdLayer.frame = CGRectMake(20, 100, 100, 50);
    [self.view.layer addSublayer:gdLayer];
    NSLog(@"start point %@",NSStringFromCGPoint(gdLayer.startPoint));
    NSLog(@"end point %@",NSStringFromCGPoint(gdLayer.endPoint));
    
}
@end
