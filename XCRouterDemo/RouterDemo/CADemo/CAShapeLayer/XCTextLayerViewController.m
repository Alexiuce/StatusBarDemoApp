//
//  XCTextLayerViewController.m
//  CADemo
//
//  Created by Alexcai on 2019/1/15.
//  Copyright © 2019 dongjiu. All rights reserved.
//

#import "XCTextLayerViewController.h"

@interface XCTextLayerViewController ()

@end

@implementation XCTextLayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.orangeColor;
    [self textDemo];
}


- (void)textDemo{
    CATextLayer *textLayer = [CATextLayer layer];
    textLayer.frame = CGRectInset(self.view.bounds, 100, 300);
    textLayer.backgroundColor = UIColor.lightGrayColor.CGColor;
    [self.view.layer addSublayer:textLayer];
    textLayer.wrapped = YES;
    /** CGFontRef: 支持使用字体的名称 */
    textLayer.font = (__bridge CGFontRef)@"American Typewriter";//(__bridge CGFontRef)[UIFont systemFontOfSize:12];
    /** 设置字体,默认为36 */
    textLayer.fontSize = 20;
    /** 文字颜色 */
    textLayer.foregroundColor = UIColor.blueColor.CGColor;
    /** 文字对齐样式 */
    textLayer.alignmentMode = kCAAlignmentLeft;
    textLayer.string = @"Lorem ipsum dolor sit amet, consectetur adipiscing \
        elit. Quisque massa arcu, eleifend vel varius in, facilisis pulvinar \
        leo. Nunc quis nunc at mauris pharetra condimentum ut ac neque. Nunc \
        elementum, libero ut porttitor dictum, diam odio congue lacus, vel \
        fringilla sapien diam at purus. Etiam suscipit pretium nunc sit amet \
        lobortis;";
    /** 设置文字缩略模式 : start, none(默认),middle, end */
    textLayer.truncationMode = kCATruncationEnd;
    /** 设置适配高清屏 */
    textLayer.contentsScale = UIScreen.mainScreen.scale;
    
}


@end
