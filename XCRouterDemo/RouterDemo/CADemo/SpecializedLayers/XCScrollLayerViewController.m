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
}

- (void)scrollLayerDemo{
    
}

@end
