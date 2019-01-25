//
//  XCEmitterLayerViewController.m
//  CADemo
//
//  Created by Alexcai on 2019/1/23.
//  Copyright © 2019 dongjiu. All rights reserved.
//

#import "XCEmitterLayerViewController.h"

@interface XCEmitterLayerViewController ()

@end

@implementation XCEmitterLayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = NSStringFromClass(self.class);
    self.view.backgroundColor = UIColor.whiteColor;
}

- (void)emitterDemo{
    CAEmitterLayer *emitterLayer = [CAEmitterLayer layer];
    emitterLayer.frame = self.view.bounds;
    [self.view.layer addSublayer:emitterLayer];
    
    emitterLayer.renderMode = kCAEmitterLayerAdditive;
    emitterLayer.emitterPosition = CGPointMake(emitterLayer.frame.size.width * 0.5, emitterLayer.frame.size.height * 0.5);
    
    
}

@end
