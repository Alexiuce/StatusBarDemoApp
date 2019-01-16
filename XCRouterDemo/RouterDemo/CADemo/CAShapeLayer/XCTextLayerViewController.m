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
    textLayer.string = @"Hello World if you like it";
    textLayer.wrapped = YES;
    /** CGFontRef: 支持使用字体的名称 */
    textLayer.font = (__bridge CGFontRef)@"American Typewriter";//(__bridge CGFontRef)[UIFont systemFontOfSize:12];
    textLayer.fontSize = 20;
    textLayer.foregroundColor = UIColor.blueColor.CGColor;
    
}


@end
