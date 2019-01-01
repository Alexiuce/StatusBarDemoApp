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
    
    CGContextStrokePath(ctx);
}

@end
