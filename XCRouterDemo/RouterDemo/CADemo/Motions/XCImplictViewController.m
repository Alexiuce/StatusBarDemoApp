//
//  XCImplictViewController.m
//  CADemo
//
//  Created by Alexcai on 2019/1/25.
//  Copyright © 2019 dongjiu. All rights reserved.
//

#import "XCImplictViewController.h"

#define XCFrame(x,y,w,h) (CGRect){x,y, w, h}

@interface XCImplictViewController ()<CALayerDelegate>

@property (nonatomic, weak) CALayer *colorLayer;

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
    [btn setImage:[UIImage imageNamed:@"girlIcon_3.9.2"] forState:UIControlStateNormal];
    [btn setTitleColor:UIColor.blueColor forState:UIControlStateNormal];
    [btn setBackgroundColor:UIColor.lightGrayColor];
    [btn addTarget:self action:@selector(clickButtonForChangeColor:) forControlEvents:UIControlEventTouchUpInside];
    
    CALayer *layer = [CALayer layer];
    layer.delegate = self;
    layer.frame = XCFrame(15, 150, 100, 100);
    layer.backgroundColor = UIColor.redColor.CGColor;
    [self.view.layer addSublayer:layer];
    self.colorLayer = layer;
    
    /** 自定义(方式1: 设置actions字典 ) 隐式动画  */
    CATransition *transition = [CATransition animation];
    transition.type = kCATransitionPush;
    transition.subtype = kCATransitionFromRight;
    layer.actions = @{@"backgroundColor":transition};
    
    /** presentation Layer : 仅当layer displayed on screen 才会创建 */
    NSLog(@"presentation layer %@",layer.presentationLayer);
    
}

#pragma mark IBAction
- (void)clickButtonForChangeColor:(UIButton *)btn{
    CGFloat red = arc4random_uniform(255) / 255.0;
    CGFloat green = arc4random_uniform(255) / 255.0;
    CGFloat blue = arc4random_uniform(255) / 255.0;
    
    [CATransaction begin];
    [CATransaction setAnimationDuration:2.0];
    [CATransaction setCompletionBlock:^{
        NSLog(@"finished....");
    }];
    self.colorLayer.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1].CGColor;
    /** btn 的layer 不会有隐式动画: 因为layer 是root layer */
    btn.layer.backgroundColor = self.colorLayer.backgroundColor;
    [CATransaction commit];
}

#pragma mark - CALayerDelegate
/** 自定义(方式2) 隐式动画( 代理方法的优先级高于 layer的actions 字典 ) */
- (id<CAAction>)actionForLayer:(CALayer *)layer forKey:(NSString *)event{
    if ([event isEqualToString:@"backgroundColor"]) {
        CATransition *transition = [CATransition animation];
        transition.type = kCATransitionPush;
        transition.subtype = kCATransitionFromLeft;
        return  transition;
    }
    return nil;
}

- (void)dealloc{
    self.colorLayer.delegate = nil;
}
@end
