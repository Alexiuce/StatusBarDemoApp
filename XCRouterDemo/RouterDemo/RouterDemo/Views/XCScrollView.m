//
//  XCScrollView.m
//  RouterDemo
//
//  Created by Alexcai on 2018/12/3.
//  Copyright © 2018 dongjiu. All rights reserved.
//

#import "XCScrollView.h"

@interface XCScrollView ()


@end


@implementation XCScrollView

- (void)awakeFromNib{
    [super awakeFromNib];
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(p_panInView:)];
    [self addGestureRecognizer:pan];
    
}



#pragma mark - Pan Gesture handle
- (void)p_panInView:(UIPanGestureRecognizer *)pan{
    CGPoint p = [pan translationInView:self];
//    self.lastPoint = CGPointMake(p.x + self.lastPoint.x, p.y + self.lastPoint.y);
    NSLog(@"%f",p.x);
    CGRect b = self.bounds;
    b.origin.x  -= p.x;
    b.origin.y -= p.y;
    self.bounds = b;
    [pan setTranslation:CGPointZero inView:self];
   
}
@end
