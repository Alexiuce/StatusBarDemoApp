//
//  XCTransformLayerViewController.m
//  CADemo
//
//  Created by Alexcai on 2019/1/16.
//  Copyright © 2019 dongjiu. All rights reserved.
//

#import "XCTransformLayerViewController.h"

@interface XCTransformLayerViewController ()

@end

@implementation XCTransformLayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = NSStringFromClass(self.class);
    self.view.backgroundColor = UIColor.lightGrayColor;
    [self transfromLayerDemo];
}

- (void)transfromLayerDemo{
    UIView *containerView = [[UIView alloc]initWithFrame:CGRectInset(self.view.bounds, 20, 100)];
    [self.view addSubview:containerView];
    [containerView.layer addSublayer:[self calayerWithTransform:CATransform3DIdentity]];
    
}
- (CALayer *)calayerWithTransform:(CATransform3D)transform{
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(-50, -50,  100, 100);
//    layer.transform = transform;
    CGFloat red = arc4random_uniform(255);
    CGFloat green = arc4random_uniform(255);
    CGFloat blue = arc4random_uniform(255);
    layer.backgroundColor = [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:1.0].CGColor;
    return layer;
}

- (CALayer *)cubeWithTransfrom:(CATransform3D)transform{
    CATransformLayer *cube = [CATransformLayer layer];
    
    return cube;
}

@end
