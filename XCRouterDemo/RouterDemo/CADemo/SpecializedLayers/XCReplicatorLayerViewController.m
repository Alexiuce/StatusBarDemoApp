//
//  XCReplicatorLayerViewController.m
//  CADemo
//
//  Created by Alexcai on 2019/1/17.
//  Copyright © 2019 dongjiu. All rights reserved.
//

#import "XCReplicatorLayerViewController.h"

@interface XCReplicatorLayerViewController ()

@end

@implementation XCReplicatorLayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = NSStringFromClass(self.class);
    self.view.backgroundColor = UIColor.whiteColor;
    [self recplicatorLayerDemo];
    [self reflectionDemo];
}

- (void)recplicatorLayerDemo{
    CAReplicatorLayer *repLayer = [CAReplicatorLayer layer];
    repLayer.frame = self.view.bounds;
    [self.view.layer addSublayer:repLayer];
    
    repLayer.instanceCount = 5;
    CATransform3D tansform = CATransform3DIdentity;
    tansform = CATransform3DTranslate(tansform, 0, 100, 0);
    repLayer.instanceTransform = tansform;
    
    repLayer.instanceRedOffset = -0.15;
    
    CALayer *itemLayer = [CALayer layer];
    itemLayer.frame = CGRectMake(50, 100, 50, 50);
    itemLayer.backgroundColor = UIColor.redColor.CGColor;
    [repLayer addSublayer:itemLayer];
    
}

- (void)reflectionDemo{
    CAReplicatorLayer *repLayer = [CAReplicatorLayer layer];
    repLayer.backgroundColor = UIColor.lightGrayColor.CGColor;
    repLayer.frame = (CGRect){200,150,100,44};
    [self.view.layer addSublayer:repLayer];
    CALayer *oriLayer = [CALayer layer];
    oriLayer.frame = CGRectMake(0, 0, 44, 44);
    oriLayer.contents = (__bridge id)([UIImage imageNamed:@"icon_datuan"].CGImage);
    [repLayer addSublayer:oriLayer];
    
    repLayer.instanceCount = 2;
    CATransform3D trans = CATransform3DIdentity;
    
    trans = CATransform3DTranslate(trans, 0, 90, 0);
    trans = CATransform3DRotate(trans, M_PI, 1, 0, 0);
    repLayer.instanceTransform = trans;
    repLayer.instanceAlphaOffset = -0.7;
    
    
}

@end
