//
//  XCDrawingView.m
//  CADemo
//
//  Created by Alexcai on 2018/12/11.
//  Copyright © 2018 dongjiu. All rights reserved.
//

#import "XCDrawingView.h"

@interface XCDrawingView ()

@property (nonatomic, strong) UIBezierPath *path;

@end


@implementation XCDrawingView

+ (Class)layerClass{
    return [CAShapeLayer class];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
//- (void)drawRect:(CGRect)rect {
//    // Drawing code
//    [UIColor.clearColor setFill];
//    [UIColor.redColor setStroke];
//    [self.path stroke];
//}

- (void)awakeFromNib{
    [super awakeFromNib];
    CAShapeLayer *layer = (CAShapeLayer *)self.layer;
    layer.fillColor = UIColor.clearColor.CGColor;
    layer.strokeColor = UIColor.redColor.CGColor;
    
    self.path = [UIBezierPath bezierPath];
    self.path.lineWidth = 5;
    self.path.lineCapStyle = kCGLineCapRound;
    self.path.lineJoinStyle = kCGLineJoinRound;
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint p = [touch locationInView:self];
    [self.path moveToPoint:p];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint p = [touch locationInView:self];
    [self.path addLineToPoint:p];
//    [self setNeedsDisplay];
    CAShapeLayer *layer = (CAShapeLayer *) self.layer;
    layer.path = self.path.CGPath;
    
}

@end
