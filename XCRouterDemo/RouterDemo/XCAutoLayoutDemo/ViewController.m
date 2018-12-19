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
//    [self p_intrinsicSizeDemo];
    [self p_constraintsPrioritiesDemo];
}


- (void)p_missingViewDemo{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(10, 50, 30, 30)];
//    view.backgroundColor = UIColor.redColor;
    [self.view addSubview:view];
    view.translatesAutoresizingMaskIntoConstraints = NO;
    
    /** 设置高度约束 */
//    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[view(==80)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(view)]];
//    /** 设置宽度 */
//    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[view]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(view)]];
    
    
    
    UIView *viewA = [[UIView alloc]initWithFrame:CGRectMake(10, 100, 20, 20)];
    viewA.backgroundColor = UIColor.blueColor;
//    viewA.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:viewA];
    
    UIView *viewB = [[UIView alloc]initWithFrame:CGRectMake(40, 240, 20, 20)];
    viewB.backgroundColor = UIColor.orangeColor;
//    viewB.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:viewB];
    
//    /** 添加约束 : 设置相互矛盾的约束会导致视图可能 missing 如下例: */
//    NSLayoutConstraint *constraint ;
//    /** 设置viewA的宽度约束为viewB宽度的2倍*/
//    constraint = [NSLayoutConstraint constraintWithItem:viewA attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:viewB attribute:NSLayoutAttributeWidth multiplier:2.0f constant:0.0f];
//    [self.view addConstraint:constraint];
//    /** 设置viewB的宽度为viewA宽度的3倍 */
//    constraint = [NSLayoutConstraint constraintWithItem:viewB attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:viewA attribute:NSLayoutAttributeWidth multiplier:3.0f constant:0];
//    [self.view addConstraint:constraint];
//
//    /** 检查view的约束是否有歧义: 仅对具体点view检查,不包含其内部的subviews */
//    NSString *hasAmbiguous =  view.hasAmbiguousLayout ? @"Ambiguous" :@"unAmbiguous";
//    NSLog(@"%@",hasAmbiguous);
//
//    /**  exerciseAmbiguityInLayout: 针对歧义约束进行随机设置frame */
//    [view exerciseAmbiguityInLayout];
//    /** 获取视图上的约束集合 */
//    NSArray <NSLayoutConstraint *>*vc = view.constraints;
//    for (NSLayoutConstraint *c in vc) {
//        NSLog(@"%@",c);
//    }
}
- (void)p_intrinsicSizeDemo{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    /** intrinsicSize 会自动根据内容 设置控件自身的宽/高 约束 */
    [button setTitle:@"Hello world" forState:UIControlStateNormal];
    NSLog(@"%@",NSStringFromCGSize(button.intrinsicContentSize));
    [button setTitle:@"On" forState:UIControlStateNormal];
    NSLog(@"%@",NSStringFromCGSize(button.intrinsicContentSize));
    /** 如果改变了控件的intrinsicContentSize 需要调用 invalidateIntrinsicContentSize 方法告知layout系统,以便在下一个布局周期时更新 */
    [button invalidateIntrinsicContentSize];

    /** 设置 intrinsicSize的约束优先级 */
    [button setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    
}

- (void)p_constraintsPrioritiesDemo{
    UIView *view = [[UIView alloc]init];
    view.backgroundColor = UIColor.redColor;
    view.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:view];
    
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1.0f constant:30.0f];
    [view addConstraint:constraint];
    
    constraint = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:1.0f constant:100.0f];
    [view addConstraint:constraint];
    
    constraint = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:view.superview attribute:NSLayoutAttributeLeading multiplier:1.0f constant:130.0f];
    [self.view addConstraint:constraint];

    constraint = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:view.superview attribute:NSLayoutAttributeTop multiplier:1.0f constant:90.0f];
    [self.view addConstraint:constraint];
}

@end
