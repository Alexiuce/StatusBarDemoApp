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

@property (nonatomic, strong) NSMutableArray <NSValue *>*strokePoints;

@end


@implementation XCDrawingView

+ (Class)layerClass{
    return [CAShapeLayer class];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    [UIColor.clearColor setFill];
    [UIColor.redColor setStroke];
    /** version 1 */
//    [self.path stroke];
    
    /** version 3 */
    for (NSValue *value in self.strokePoints) {
        CGPoint p = value.CGPointValue;
        CGRect dr = [self getDrawRectWithPoint:p];
        
        if (CGRectIntersectsRect(rect, dr)) {
            [[UIImage imageNamed:@"icon_inform"] drawInRect:dr];            
        }
        
    }
}

- (void)awakeFromNib{
    [super awakeFromNib];
    /** version 2: 使用 cashperlayer 代替drawRect */
//    CAShapeLayer *layer = (CAShapeLayer *)self.layer;
//    layer.fillColor = UIColor.clearColor.CGColor;
//    layer.strokeColor = UIColor.redColor.CGColor;
    
    
    /** version 3: 优化drawRect,仅绘制需要变动的范围 */
    self.strokePoints = [NSMutableArray array];
    
    
    self.path = [UIBezierPath bezierPath];
    self.path.lineWidth = 5;
    self.path.lineCapStyle = kCGLineCapRound;
    self.path.lineJoinStyle = kCGLineJoinRound;
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint p = [touch locationInView:self];
//    [self.path moveToPoint:p];
    
    [self addPointToStorkes:p];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint p = [touch locationInView:self];
//    [self.path addLineToPoint:p];
    /** version 1 */
//    [self setNeedsDisplay];
    
    /** version 2*/
//    CAShapeLayer *layer = (CAShapeLayer *) self.layer;
//    layer.path = self.path.CGPath;
    
    /** version 3 */
    [self addPointToStorkes:p];
    
}


- (void)addPointToStorkes:(CGPoint)p{
    [self.strokePoints addObject:[NSValue valueWithCGPoint:p]];
//    [self setNeedsDisplay];
    [self setNeedsDisplayInRect:[self getDrawRectWithPoint:p]];
}

- (CGRect)getDrawRectWithPoint:(CGPoint)p{
    return CGRectMake(p.x - 26, p.y - 26, 52, 52);
}

@end
