//
//  XCExplicitViewController.m
//  CADemo
//
//  Created by Alexcai on 2019/1/31.
//  Copyright © 2019 dongjiu. All rights reserved.
//

#import "XCExplicitViewController.h"

@interface XCExplicitViewController ()<CAAnimationDelegate>

@property (nonatomic, weak) UIImageView *imageView;
@property (nonatomic, weak) CATextLayer *textLayer;

@end

@implementation XCExplicitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = NSStringFromClass(self.class);
    self.view.backgroundColor = UIColor.whiteColor;
    [self imageView];
    [self basicAnimationDemo];
    [self keyFrameAnimationDemo];
    [self groupAnimationDemo];
}

- (void)basicAnimationDemo{
    CALayer *layer = [CALayer layer];
    layer.frame = (CGRect){30,130,100,50};
    layer.backgroundColor = UIColor.redColor.CGColor;
    layer.anchorPoint = CGPointZero;
    [self.view.layer addSublayer:layer];
    
    CABasicAnimation *animation = [CABasicAnimation animation];
    NSLog(@"create animation %@",animation);
    animation.delegate = self;
    animation.keyPath = @"position.y";
    animation.toValue = @(400);
    animation.duration = 3.0f;
    [layer addAnimation:animation forKey:nil];
    
    
}

- (void)keyFrameAnimationDemo{
    CATextLayer *colorLayer = [CATextLayer layer];
    colorLayer.backgroundColor = UIColor.blueColor.CGColor;
    colorLayer.frame = (CGRect){220,130, 190,50};
    colorLayer.string = @"Color Layer";
    [self.view.layer addSublayer:colorLayer];
    self.textLayer = colorLayer;
    
    
    CAKeyframeAnimation *keyAnimation = [CAKeyframeAnimation animation];
    keyAnimation.keyPath = @"backgroundColor";
    keyAnimation.duration = 3.0;
    keyAnimation.values = @[(__bridge id)UIColor.blueColor.CGColor,
                            (__bridge id)UIColor.redColor.CGColor,
                            (__bridge id)UIColor.yellowColor.CGColor,
                            (__bridge id)UIColor.blueColor.CGColor
                            ];
    
    
    [colorLayer addAnimation:keyAnimation forKey:nil];
    
    
    /** CAShapeLayer & Animation */
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.fillColor = UIColor.clearColor.CGColor;
    shapeLayer.strokeColor = UIColor.grayColor.CGColor;
    shapeLayer.lineWidth = 4;
    
    [self.view.layer addSublayer:shapeLayer];
    
    /** 添加路径 */
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:(CGPoint){180, 250} radius:50 startAngle:0 endAngle:M_PI_2 clockwise:YES];
    shapeLayer.path = path.CGPath;

    /** 添加红色layer */
    CALayer *redLayer = [CALayer layer];
    redLayer.frame = (CGRect){180,250,20,20};
    redLayer.backgroundColor = UIColor.redColor.CGColor;
    [self.view.layer addSublayer:redLayer];
    
    /** 添加动画 */
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
    anim.keyPath = @"position";
    anim.path = path.CGPath;
    anim.duration = 3.0;
    [redLayer addAnimation:anim forKey:nil];
    
}

- (void)groupAnimationDemo{
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    CGFloat x = 50;
    CGFloat y = 500;
    CGFloat x_length = 300;
    CGFloat y_control = 150;
    CGFloat x_control = 150;
    [path moveToPoint:(CGPoint){x,y}];
    
    [path addCurveToPoint:(CGPoint){x + x_length,y} controlPoint1:(CGPoint){x+x_control,y - y_control} controlPoint2:(CGPoint){x + x_length - x_control,y + y_control}];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    [self.view.layer addSublayer:shapeLayer];
    shapeLayer.path = path.CGPath;
    shapeLayer.fillColor = UIColor.clearColor.CGColor;
    shapeLayer.strokeColor = UIColor.blueColor.CGColor;
    shapeLayer.lineWidth = 2.0;
    
    CALayer *layer = [CALayer layer];
    layer.frame = (CGRect){0,0,50,50};
    layer.position = (CGPoint){x,y};
    layer.backgroundColor = UIColor.redColor.CGColor;
    [self.view.layer addSublayer:layer];
    
    CAKeyframeAnimation *a1 = [CAKeyframeAnimation animation];
    a1.keyPath = @"position";
    a1.path = path.CGPath;
    
    CABasicAnimation *a2 = [CABasicAnimation animation];
    a2.keyPath = @"backgroundColor";
    a2.toValue = (__bridge id _Nullable)(UIColor.blueColor.CGColor);
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.duration = 3.0;
    group.animations = @[a1,a2];
    
    [layer addAnimation:group forKey:nil];
    
}

- (void)transitionDemo{
    /** layer transition animation */
//    CATransition *transition = [CATransition animation];
//    transition.type = kCATransitionPush;
//    transition.subtype = kCATransitionFromTop;
//    transition.duration = 2.0;
//
//    [self.imageView.layer addAnimation:transition forKey:nil];
//    self.imageView.image = [UIImage imageNamed:@"icon-service4"];
    
    /** UIView transition */
    [UIView transitionWithView:self.imageView duration:2.0 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
        self.imageView.image =  [UIImage imageNamed:@"icon-service4"];
    } completion:^(BOOL finished) {
        
    }];
}

#pragma mark Touch Event handle
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint p = [touch locationInView:self.view];
    CGPoint np = [self.view.layer convertPoint:p toLayer:self.textLayer];
    if ([self.textLayer containsPoint:np]) {
        CATransition *transition = [CATransition animation];
        transition.duration = 2.0;
        transition.type = kCATransitionFade;
        [self.textLayer addAnimation:transition forKey:nil];
        self.textLayer.string = @"New Text";
        return;
    }
    
    /** 开启位图上下文 , 进行截屏*/
    UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, YES, UIScreen.mainScreen.scale);
    /** 保存layer 的内容 到位图上下文 */
    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    /** 获取图片 */
    UIImage *pic = UIGraphicsGetImageFromCurrentImageContext();
    /** 关闭图形上下文 */
    UIGraphicsEndImageContext();
    /** 创建snap view */
    UIImageView *maskImageView = [[UIImageView alloc]initWithImage:pic];
    maskImageView.frame = self.view.bounds;
    [self.view addSubview:maskImageView];
    
    [UIView animateWithDuration:2.0 animations:^{
        CGAffineTransform transform = CGAffineTransformMakeScale(0.01, 0.01);
        transform = CGAffineTransformRotate(transform, M_PI_2);
        maskImageView.transform = transform;
    } completion:^(BOOL finished) {
        [maskImageView removeFromSuperview];
    }];
    
}

#pragma mark CAAnimationDelegate
/** anim 与layer 的animation 不是同一个对象: 代理方法中anim 是layer animation 的一个不可变copy */
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    if (flag) {
        NSLog(@"animation finished %@",anim);
        
    }
}

#pragma mark - getter
- (UIImageView *)imageView{
    if (_imageView == nil) {
        UIImage *img = [UIImage imageNamed:@"icon_inform"];
        UIImageView *imgView = [[UIImageView alloc]initWithImage:img];
        imgView.frame = (CGRect){150,550, 80,80};
        [self.view addSubview:imgView];
        
        imgView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(transitionDemo)];
        [imgView addGestureRecognizer:tap];
        
        _imageView = imgView;
    }
    return _imageView;
}
@end
