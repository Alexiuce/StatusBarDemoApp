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
    [self contextPedanticTranslateCTM:ctx];
    /** UIKit 持有的CGContext 以左上角为0,0 ; 否则以左下角为0,0*/
//    CGContextMoveToPoint(ctx, 10, 10);
//    CGContextAddLineToPoint(ctx, 50, 50);
    
    
    /** 每个图形上下文都有一个自己的绘图状态栈,保存当前上下文的绘图属性信息:颜色,线条粗细等.. */
//    CGContextSetLineWidth(ctx, 5);
//    [UIColor.redColor set];
//    CGContextStrokePath(ctx);
//    CGContextSaveGState(ctx);
//
//
//    [UIColor.yellowColor set];
//    CGContextSetLineWidth(ctx, 10);
//    CGContextAddRect(ctx, CGRectMake(20, 20, 100, 30));
//    CGContextStrokePath(ctx);
//
//    CGContextRestoreGState(ctx);
//    CGContextMoveToPoint(ctx, 20, 30);
//    CGContextAddLineToPoint(ctx, 80, 30);
//    CGContextStrokePath(ctx);
    
//    [self contextTransform:ctx];
}


- (void)contextTransform:(CGContextRef)ctx{
    UIFont *font = [UIFont systemFontOfSize:15];
    NSString *alphabet = @"ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    CGFloat raduis = 50;
    CGFloat detla = -2 * M_PI / 26.0;
    for (int i = 0; i < 26; i++) {
        NSString *letter = [alphabet substringWithRange:NSMakeRange(i, 1)];
        CGSize letterSize = [letter sizeWithAttributes:@{NSFontAttributeName: font}];
        CGFloat theta = i * detla;
        CGFloat x = 100 + raduis *cos(theta) - letterSize.width * 0.5;
        CGFloat y = 70 + raduis *sin(theta) - letterSize.height * 0.5;
        [letter drawAtPoint:CGPointMake(x, y) withAttributes:@{NSFontAttributeName: font}];
    }
}

- (void)contextTranslateCTM:(CGContextRef)ctx{
    UIFont *font = [UIFont systemFontOfSize:15];
    NSString *alphabet = @"ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    CGPoint center = {120, 60};
    CGFloat raduis = 50;
    CGFloat detla = 2 * M_PI / 26.0;
    CGContextTranslateCTM(ctx, center.x, center.y);
    for (int i = 0; i < 26 ; ++i) {
        NSString *letter = [alphabet substringWithRange:NSMakeRange(i, 1)];
        CGSize letterSize = [letter sizeWithAttributes:@{NSFontAttributeName: font}];
        CGFloat theta = i * detla;
        CGContextSaveGState(ctx);
        CGContextRotateCTM(ctx, theta);
        CGContextTranslateCTM(ctx, -letterSize.width * 0.5, -raduis);
        [letter drawAtPoint:CGPointZero withAttributes:@{NSFontAttributeName: font}];
        CGContextRestoreGState(ctx);
    }
}

- (void)contextPedanticTranslateCTM:(CGContextRef)ctx{
    UIFont *font = [UIFont systemFontOfSize:15];
    NSString *alphabet = @"ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    CGPoint center = {120, 60};
    CGFloat raduis = 50;
//    CGFloat detla = 2 * M_PI / 26.0;
    CGContextTranslateCTM(ctx, center.x, center.y);
    CGFloat totalWidth = 0;
    for (int i = 0; i < 26 ; ++i) {
        NSString *letter = [alphabet substringWithRange:NSMakeRange(i, 1)];
        CGSize letterSize = [letter sizeWithAttributes:@{NSFontAttributeName: font}];
        totalWidth += letterSize.width;
    }
    CGFloat consumeSize = 0;
    for (int i = 0; i < 26 ; ++i) {
        NSString *letter = [alphabet substringWithRange:NSMakeRange(i, 1)];
        CGSize letterSize = [letter sizeWithAttributes:@{NSFontAttributeName: font}];
        consumeSize += letterSize.width * 0.5;
        CGFloat percent = consumeSize / totalWidth;
        consumeSize += letterSize.width * 0.5;
        CGFloat theta = percent * 2 * M_PI;
        CGContextSaveGState(ctx);
        CGContextRotateCTM(ctx, theta);
        CGContextTranslateCTM(ctx, -letterSize.width * 0.5, -raduis);
        [letter drawAtPoint:CGPointZero withAttributes:@{NSFontAttributeName: font}];
        CGContextRestoreGState(ctx);
    }
    
}

@end
