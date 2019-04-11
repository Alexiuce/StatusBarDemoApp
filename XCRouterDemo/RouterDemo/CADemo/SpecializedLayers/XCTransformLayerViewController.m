//
//  XCTransformLayerViewController.m
//  CADemo
//
//  Created by Alexcai on 2019/1/16.
//  Copyright © 2019 dongjiu. All rights reserved.
//

#import "XCTransformLayerViewController.h"

@interface XCTransformLayerViewController ()

@property (nonatomic, weak) UIView * containerView;

@end

@implementation XCTransformLayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = NSStringFromClass(self.class);
    self.view.backgroundColor = UIColor.lightGrayColor;
    [self transfromLayerDemo];
}

- (void)transfromLayerDemo{
    UIView *containerView = [[UIView alloc]initWithFrame:CGRectInset(self.view.bounds, 20, 100)];
    [self.view addSubview:containerView];
    _containerView = containerView;
    
    CATransform3D pt = CATransform3DIdentity;
    pt.m34 = - 1.0 / 500.0;
    containerView.layer.sublayerTransform = pt;
    
    CATransform3D c1t = CATransform3DIdentity;
    c1t = CATransform3DTranslate(c1t, 200, 0, 0);
    CALayer *cube1 = [self cubeWithTransfrom:c1t];
    [containerView.layer addSublayer:cube1];
    
    CATransform3D c2t = CATransform3DIdentity;
    c2t = CATransform3DTranslate(c2t, 150, 200, 0);
    c2t = CATransform3DRotate(c2t, M_PI_4, 1, 0, 0);
    c2t = CATransform3DRotate(c2t, M_PI_4, 0, 1, 0);
    CALayer *cube2 = [self cubeWithTransfrom:c2t];
    [containerView.layer addSublayer:cube2];
    
    
}
- (CALayer *)calayerWithTransform:(CATransform3D)transform{
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(50, 50,  100, 100);
    layer.transform = transform;
    CGFloat red = arc4random_uniform(255);
    CGFloat green = arc4random_uniform(255);
    CGFloat blue = arc4random_uniform(255);
    layer.backgroundColor = [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:1.0].CGColor;
    return layer;
}

- (CALayer *)cubeWithTransfrom:(CATransform3D)transform{
    CATransformLayer *cube = [CATransformLayer layer];
    /** 添加正面face */
    CATransform3D ct = CATransform3DMakeTranslation(0, 0, 50);
    [cube addSublayer:[self calayerWithTransform:ct]];
    
    /** 添加右侧面 */
    ct = CATransform3DMakeTranslation(50, 0, 0);
    ct = CATransform3DRotate(ct, M_PI_2, 0, 1, 0);
    [cube addSublayer:[self calayerWithTransform:ct]];
    /** 添加底部面 */
    ct = CATransform3DMakeTranslation(0, -50, 0);
    ct = CATransform3DRotate(ct, M_PI_2, 1, 0, 0);
    [cube addSublayer:[self calayerWithTransform:ct]];
    /** 添加顶部面 */
    ct = CATransform3DMakeTranslation(0, 50, 0);
    ct = CATransform3DRotate(ct, -M_PI_2, 1, 0, 0);
    [cube addSublayer:[self calayerWithTransform:ct]];
    /** 添加左侧面 */
    ct = CATransform3DMakeTranslation(-50, 0, 0 );
    ct = CATransform3DRotate(ct, -M_PI_2, 0, 1, 0);
    [cube addSublayer:[self calayerWithTransform:ct]];
    
    /** 添加背部面 */
    
    ct = CATransform3DMakeTranslation(0, 0, -50);
    [cube addSublayer:[self calayerWithTransform:ct]];
    
    cube.frame = self.containerView.bounds;
    cube.transform = transform;
    return cube;
}

@end
