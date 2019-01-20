//
//  XCScrollLayerViewController.m
//  CADemo
//
//  Created by Alexcai on 2019/1/19.
//  Copyright © 2019 dongjiu. All rights reserved.
//

#import "XCScrollLayerViewController.h"

@interface XCScrollLayerViewController ()

@property (nonatomic, weak) CAScrollLayer *scrollLayer;

@end

@implementation XCScrollLayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = NSStringFromClass(self.class);
    self.view.backgroundColor = UIColor.whiteColor;
    [self scrollLayerDemo];
}

- (void)scrollLayerDemo{
    CAScrollLayer *sl = [CAScrollLayer layer];
    sl.backgroundColor = UIColor.lightGrayColor.CGColor;
    sl.frame = CGRectMake(100, 150, 200, 200);
    [self.view.layer addSublayer:sl];
    UIImage *img = [UIImage imageNamed:@"scrollImage.jpg"];
    sl.contents = (__bridge id _Nullable)(img.CGImage);
    self.scrollLayer = sl;
}



@end
