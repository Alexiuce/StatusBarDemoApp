//
//  ViewController.m
//  CADemo
//
//  Created by Alexcai on 2018/12/4.
//  Copyright © 2018 dongjiu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (nonatomic, strong) CALayer *redLayer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.redLayer = [CALayer layer];
    self.redLayer.frame = CGRectInset(self.containerView.bounds, 30, 80);
    self.redLayer.backgroundColor = UIColor.redColor.CGColor;
    [self.containerView.layer addSublayer:self.redLayer];
}

- (IBAction)clickChangeColorButton:(UIButton *)sender {
    CGFloat red = arc4random() /(CGFloat) INT_MAX;
    CGFloat green = arc4random() / (CGFloat) INT_MAX;
    CGFloat blue = arc4random() / (CGFloat) INT_MAX;
    self.redLayer.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1].CGColor;
}

@end
