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
    [self emitterDemo];
}
/** EmitterLayer test */
- (void)emitterDemo{
    CAEmitterLayer *emitterLayer = [CAEmitterLayer layer];
    emitterLayer.frame = self.view.bounds;
    [self.view.layer addSublayer:emitterLayer];
    
    emitterLayer.renderMode = kCAEmitterLayerAdditive;
    emitterLayer.emitterPosition = CGPointMake(emitterLayer.frame.size.width * 0.5, emitterLayer.frame.size.height * 0.5);
    
    CAEmitterCell *cell = [CAEmitterCell emitterCell];
    cell.contents = (__bridge id _Nullable)([UIImage imageNamed:@"icon-service4"].CGImage);
    
    cell.birthRate = 1;
    cell.lifetime = 5.0;
//    cell.color = [UIColor colorWithRed:1 green:0.5 blue:0.1 alpha:1].CGColor;
    cell.alphaSpeed = -0.4;
    cell.velocity = 40;
    cell.velocityRange = 30;
    cell.emissionRange = M_PI ;
    
    emitterLayer.emitterCells = @[cell];
    
    
    
}

@end
