//
//  XCDrawingView.m
//  XCDrawing
//
//  Created by Alexcai on 2018/12/31.
//  Copyright © 2018 dongjiu. All rights reserved.
//

#import "XCDrawingView.h"

@implementation XCDrawingView


- (void)drawRect:(CGRect)rect{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    /** UIKit 持有的CGContext 以左上角为0,0 ; 否则以左下角为0,0*/
    CGContextMoveToPoint(ctx, 10, 10);
    CGContextAddLineToPoint(ctx, 50, 50);
    
    
    /** 每个图形上下文都有一个自己的绘图状态栈,保存当前上下文的绘图属性信息:颜色,线条粗细等.. */
    CGContextSetLineWidth(ctx, 5);
    [UIColor.redColor set];
    CGContextStrokePath(ctx);
    CGContextSaveGState(ctx);
    
    
    [UIColor.yellowColor set];
    CGContextSetLineWidth(ctx, 10);
    CGContextAddRect(ctx, CGRectMake(20, 20, 100, 30));
    CGContextStrokePath(ctx);
    
    CGContextRestoreGState(ctx);
    CGContextMoveToPoint(ctx, 20, 30);
    CGContextAddLineToPoint(ctx, 80, 30);
    CGContextStrokePath(ctx);
    
    
}

@end
