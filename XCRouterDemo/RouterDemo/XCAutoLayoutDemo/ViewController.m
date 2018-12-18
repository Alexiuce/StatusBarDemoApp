//
//  ViewController.m
//  XCAutoLayoutDemo
//
//  Created by Alexcai on 2018/12/17.
//  Copyright © 2018 dongjiu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    [self p_missingViewDemo];
    [self p_intrinsicSizeDemo];
}


- (void)p_missingViewDemo{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
    view.backgroundColor = UIColor.redColor;
    [self.view addSubview:view];
    view.translatesAutoresizingMaskIntoConstraints = NO;
    
    /** 设置高度约束 */
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[view(==80)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(view)]];
    /** 设置宽度 */
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[view]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(view)]];
    
    
    
    UIView *viewA = [[UIView alloc]initWithFrame:CGRectMake(10, 10, 20, 20)];
    viewA.backgroundColor = UIColor.blueColor;
    viewA.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:viewA];
    
    UIView *viewB = [[UIView alloc]initWithFrame:CGRectMake(40, 40, 20, 20)];
    viewB.backgroundColor = UIColor.orangeColor;
    viewB.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:viewB];
    
    /** 添加约束 : 设置相互矛盾的约束会导致视图可能 missing 如下例: */
    NSLayoutConstraint *constraint ;
    /** 设置viewA的宽度约束为viewB宽度的2倍*/
    constraint = [NSLayoutConstraint constraintWithItem:viewA attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:viewB attribute:NSLayoutAttributeWidth multiplier:2.0f constant:0.0f];
    [self.view addConstraint:constraint];
    /** 设置viewB的宽度为viewA宽度的3倍 */
    constraint = [NSLayoutConstraint constraintWithItem:viewB attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:viewA attribute:NSLayoutAttributeWidth multiplier:3.0f constant:0];
    [self.view addConstraint:constraint];
    
    /** 检查view的约束是否有歧义: 仅对具体点view检查,不包含其内部的subviews */
    NSString *hasAmbiguous =  view.hasAmbiguousLayout ? @"Ambiguous" :@"unAmbiguous";
    NSLog(@"%@",hasAmbiguous);
    
    /**  exerciseAmbiguityInLayout: 针对歧义约束进行随机设置frame */
    [view exerciseAmbiguityInLayout];
    /** 获取视图上的约束集合 */
    NSArray <NSLayoutConstraint *>*vc = view.constraints;
    for (NSLayoutConstraint *c in vc) {
        NSLog(@"%@",c);
    }
}
- (void)p_intrinsicSizeDemo{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    
    [button setTitle:@"Hello world" forState:UIControlStateNormal];
    NSLog(@"%@",NSStringFromCGSize(button.intrinsicContentSize));
    [button setTitle:@"On" forState:UIControlStateNormal];
    NSLog(@"%@",NSStringFromCGSize(button.intrinsicContentSize));
    
    
    
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    for (UIView *v in self.view.subviews) {
        NSLog(@"%@ frame == %@",v, NSStringFromCGRect(v.frame));

    }
}
@end
