//
//  XCShapeViewController.m
//  CADemo
//
//  Created by Alexcai on 2019/1/6.
//  Copyright © 2019 dongjiu. All rights reserved.
//

/* 使用CAShpeLayer 相对 Core Graphic的好处:
 1. It’s fast—CAShapeLayer uses hardware-accelerated drawing and is much faster than using Core Graphics to draw an image.
 使用硬件加速绘制(GPU),速度快
 2. It’s memory efficient—A CAShapeLayer does not have to create a backing image like an ordinary CALayer does, so no matter how large it gets, it won’t consume much memory.
 节省内存(不会创建图形上下文),因此无论多大,都不会消耗过多内存;
 3. It doesn’t get clipped to the layer bounds — A CAShapeLayer can happily draw outside of its bounds. Your path will not get clipped like it does when you draw into a regular CALayer using Core Graphics (as you saw in Chapter 2).
 可以绘制bounce之外的部分;
 4.  There’s no pixelation—When you transform a CAShapeLayer by scaling it up or moving it closer to the camera with a 3D perspective transform, it does not become pixelated like an ordinary layer’s backing image would.
 不会像素化图片(形变时)
 */

#import "XCShapeViewController.h"

@interface XCShapeViewController ()

@end

@implementation XCShapeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self simpleShapeDemo];
}

- (void)simpleShapeDemo{
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 100, 60)];
    
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.fillColor = UIColor.redColor.CGColor;
    layer.path = path.CGPath;
    [self.view.layer addSublayer:layer];
}

@end
