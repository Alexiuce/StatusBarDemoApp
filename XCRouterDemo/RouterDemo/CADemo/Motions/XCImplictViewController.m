//
//  XCImplictViewController.m
//  CADemo
//
//  Created by Alexcai on 2019/1/25.
//  Copyright © 2019 dongjiu. All rights reserved.
//

#import "XCImplictViewController.h"

#define XCFrame(x,y,w,h) (CGRect){x,y, w, h}

@interface XCImplictViewController ()

@end

@implementation XCImplictViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = NSStringFromClass(self.class);
    self.view.backgroundColor = UIColor.whiteColor;
    [self implicitDemo];
}

- (void)implicitDemo{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = XCFrame(15, 100, 120, 40);
    [self.view addSubview:btn];

    [btn setTitle:@"Chage Color" forState:UIControlStateNormal];
    [btn setTitleColor:UIColor.blueColor forState:UIControlStateNormal];
    [btn setBackgroundColor:UIColor.lightGrayColor];
    [btn addTarget:self action:@selector(clickButtonForChangeColor:) forControlEvents:UIControlEventTouchUpInside];
    
}

#pragma mark IBAction
- (void)clickButtonForChangeColor:(UIButton *)btn{
    
    [CATransaction begin];
    [CATransaction setAnimationDuration:2.0];
    [CATransaction setCompletionBlock:^{
        NSLog(@"finished....");
    }];
    CGFloat red = arc4random_uniform(255) / 255.0;
    CGFloat green = arc4random_uniform(255) / 255.0;
    CGFloat blue = arc4random_uniform(255) / 255.0;
    btn.layer.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1].CGColor;
    [CATransaction commit];
}

@end
