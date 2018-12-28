//
//  ViewController.m
//  CADemo
//
//  Created by Alexcai on 2018/12/4.
//  Copyright © 2018 dongjiu. All rights reserved.
//

#import "ViewController.h"

#import "XCViewModel.h"


#define MYNUMBER 10

%:define MYNEWNUMBER 20


@interface Spark : NSObject
@property(nonatomic,copy) NSString *name;
//@property (nonatomic, assign) int age1;
//@property (nonatomic, assign) int age;

@end

@implementation Spark

- (void)speak {
//    NSLog(@"self address == %p",self);
//    NSLog(@"%d",self.age);
//    NSLog(@"self age1 =  %d, age = %d ",self.age1,self.age);
    NSLog(@"My name is:%@",self.name);
}

@end

/** c89 中 如果函数的返回值为int 类型,可以省略不写 */
//my_function(){
//    return 20;
//}



//static inline CGFloat GetScreenWidth(){
//    return UIScreen.mainScreen.bounds.size.width;
//}

//static inline CGFloat GetScreenHeight(){
//    return UIScreen.mainScreen.bounds.size.height;
//}


@interface ViewController ()<CALayerDelegate>
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (nonatomic, strong) CALayer *redLayer;

@property (nonatomic, strong) UIBezierPath *path;
@property (nonatomic, strong) CALayer *moveLayer;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UILabel *timeOffsetLabel;
@property (weak, nonatomic) IBOutlet UILabel *speedLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /**
    int 哈哈 = 20;
    NSString *😀 = @"empty";

    NSLog(@"%@",😀);
    NSLog(@"%d",MYNEWNUMBER);
//    [self p_setupBezierPath];
    // 获取系统最后一次重启后到当前的时间秒数;
//    CFTimeInterval time = CACurrentMediaTime();
//    NSLog(@"time = %f",time);
     */
//    <:self p_graphCAMediaTimingFunc:>;
//    [self p_shareLayer];
   
//    [self p_objcDemo];
//    id cls = [Spark class];
//    void *obj = &cls;
//    [(__bridge id)obj speak];
    [self p_addLayer];
//    [self p_addLayerContents];
}

- (void)p_addLayer{
    CALayer *layer = [CALayer layer];
//    CGFloat w = GetScreenWidth();
    layer.frame = CGRectMake(150, 20,100, 100);
    /** 1. layer 的背景色影响阴影效果: 如果时透明色,则阴影会根据layer的内容进行投射, 否则根据layer 形状进行投射
     具体的阴影效果,需要根据阴影的相关属性显示
     */
    layer.backgroundColor = UIColor.blueColor.CGColor;
//    layer.delegate = self;
    UIImage *img = [UIImage imageNamed:@"icon_datuan"];
    layer.contents = (__bridge id)img.CGImage;
    [self.containerView.layer addSublayer:layer];
//    [layer display];
    //    layer.hidden = YES;
    layer.shadowOpacity = 1;
    /** 阴影三件套属性 */
//    layer.shadowColor = UIColor.redColor.CGColor;
//    layer.shadowOffset = CGSizeMake(130, 30);
//    layer.shadowRadius = 5;
    /** 使用shadowPath 可以绘制自定义的阴影形状 */
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(100, 30, 50, 50)];
    layer.shadowPath = path.CGPath;
    
    
}

#pragma mark - CALayerDelegate
- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx{
    CGContextSetLineWidth(ctx, 10);
    CGContextSetStrokeColorWithColor(ctx, UIColor.redColor.CGColor);
    CGContextStrokeEllipseInRect(ctx, layer.bounds);
}

#pragma mark - Private method
- (void)p_addLayerContents{
    UIImage *img = [UIImage imageNamed:@"icon_shangfen"];
    self.containerView.layer.contents = (__bridge id)img.CGImage;
    /** contentsGravity 相当于UIView的contentMode: 设置内容的对齐方式 */
//    self.containerView.layer.geometryFlipped = YES;
    self.containerView.layer.contentsGravity = kCAGravityResizeAspect;
    self.containerView.layer.contentsScale = img.scale;
}

- (void)p_objcDemo{
    
//    char *a = "a";
//    char *b = "b";
//    char *c = "f";
//    NSLog(@"%d == %d == %d",a[4],*b,*c);
    
//    float f1 = 3.141526;
//    double d1 = f1; // d1 = 3.141526
//    NSLog(@"d1 == f1 ?  %d",d1 == f1);
//
//
//    size_t lengthA = sizeof(NSString *);
//    NSLog(@"%zu", lengthA);
//    NSString *a = @"Hello~";
//    NSString *b = @"World";
//    NSLog(@"b address ==%p  b objc == %p",&b,b);
    int a = 4;
    int b = 3;
    int c = 5;
    int d = 2;
//    NSObject *
//     03 00 00 00 04 00 00 00
//    NSString *s = @"adfd";
//    UIView *v = self.view;
//    NSNumber *n = @(2);
    id cls = [Spark class];
    
    
//    {
//        起始地址 +8 _
//        isa, 8
//        第一个属性
//        第二个...
//        第三个..
//    }
//    NSLog(@"cls address == %p",&cls);
//    NSLog(@"a string address ==  %p",&a);
//    NSLog(@"%p  %p",a,cls);
    void *obj = &cls;
//    NSLog(@"%p, %p",&cls,self);
    
    [(__bridge id)obj speak];
    
    
    /** 汇编代码
     0x10df643c0 <+0>:   pushq  %rbp
     0x10df643c1 <+1>:   movq   %rsp, %rbps
     0x10df643c4 <+4>:   subq   $0x30, %rsp
     0x10df643c8 <+8>:   leaq   0x5e71(%rip), %rax        ; @"Hello~"
     0x10df643cf <+15>:  movq   %rdi, -0x8(%rbp)
     0x10df643d3 <+19>:  movq   %rsi, -0x10(%rbp)
     0x10df643d7 <+23>:  movq   %rax, %rdi
     0x10df643da <+26>:  callq  *0x5c78(%rip)             ; (void *)0x000000010e920fa0: objc_retain
     0x10df643e0 <+32>:  movq   %rax, -0x18(%rbp)
     0x10df643e4 <+36>:  movq   0x8145(%rip), %rax        ; (void *)0x000000010df6c788: Spark
     0x10df643eb <+43>:  movq   0x7d7e(%rip), %rsi        ; "class"
     0x10df643f2 <+50>:  movq   %rax, %rdi
     0x10df643f5 <+53>:  callq  *0x5c4d(%rip)             ; (void *)0x000000010e923d80: objc_msgSend
     0x10df643fb <+59>:  movq   %rax, %rdi
     0x10df643fe <+62>:  callq  0x10df677ca               ; symbol stub for: objc_retainAutoreleasedReturnValue
     0x10df64403 <+67>:  leaq   -0x20(%rbp), %rsi
     0x10df64407 <+71>:  movq   %rax, -0x20(%rbp)
     0x10df6440b <+75>:  movq   %rsi, -0x28(%rbp)
     0x10df6440f <+79>:  movq   -0x28(%rbp), %rdi
     0x10df64413 <+83>:  movq   0x7f2e(%rip), %rsi        ; "speak"
     0x10df6441a <+90>:  callq  *0x5c28(%rip)             ; (void *)0x000000010e923d80: objc_msgSend
     0x10df64420 <+96>:  leaq   -0x20(%rbp), %rdi
     0x10df64424 <+100>: xorl   %ecx, %ecx
     0x10df64426 <+102>: movl   %ecx, %esi
     0x10df64428 <+104>: callq  0x10df677d6               ; symbol stub for: objc_storeStrong
     0x10df6442d <+109>: xorl   %ecx, %ecx
     0x10df6442f <+111>: movl   %ecx, %esi
     0x10df64431 <+113>: leaq   -0x18(%rbp), %rax
     0x10df64435 <+117>: movq   %rax, %rdi
     0x10df64438 <+120>: callq  0x10df677d6               ; symbol stub for: objc_storeStrong
     0x10df6443d <+125>: addq   $0x30, %rsp
     0x10df64441 <+129>: popq   %rbp
     0x10df64442 <+130>: retq
     
     
     */
}

- (void)p_shareLayer{
    CAShapeLayer *blueLayer = [CAShapeLayer layer];
//    blueLayer.frame = CGRectMake(50, 50, 200, 200);
    blueLayer.position = CGPointMake(50, 50);
    blueLayer.fillColor = UIColor.blueColor.CGColor;
//    blueLayer.backgroundColor = UIColor.redColor.CGColor;
    blueLayer.path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 100, 100) cornerRadius:20].CGPath;
    [self.containerView.layer addSublayer:blueLayer];
}

- (IBAction)playAnimationDemo:(UIButton *)sender{
    /** 创建关键帧动画 */
    CAKeyframeAnimation *keyAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    keyAnimation.duration = 4.0f;
    keyAnimation.timeOffset = self.timeOffsetLabel.text.doubleValue;
    keyAnimation.speed = self.speedLabel.text.doubleValue;
    keyAnimation.path = self.path.CGPath;
    keyAnimation.rotationMode = kCAAnimationRotateAuto;
    [self.moveLayer addAnimation:keyAnimation forKey:nil];
    
}

- (IBAction)changedTimeOffset:(UISlider *)sender {
    self.timeOffsetLabel.text = [NSString stringWithFormat:@"%.1f",sender.value];
}


- (IBAction)changedSpeed:(UISlider *)sender {
    self.speedLabel.text = [NSString stringWithFormat:@"%.1f",sender.value];
}


- (IBAction)clickChangeColorButton:(UIButton *)sender {
    
//    [CATransaction begin];
//    [CATransaction setAnimationDuration:5.0];
    
//    CGFloat red = arc4random() /(CGFloat) INT_MAX;
//    CGFloat green = arc4random() / (CGFloat) INT_MAX;
//    CGFloat blue = arc4random() / (CGFloat) INT_MAX;
//    UIColor *color = [UIColor colorWithRed:red green:green blue:blue alpha:1];
    /** 1. CABasicAnimation */
//    CABasicAnimation *a1 = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
//    a1.toValue = (__bridge id)color.CGColor;
//    [self.redLayer addAnimation:a1 forKey:nil];
    
    
    /** 2. Keyframe Animation */
    CAKeyframeAnimation *ka = [CAKeyframeAnimation animationWithKeyPath:@"backgroundColor"];
    ka.duration = 2.0;
    ka.values = @[(__bridge id)UIColor.redColor.CGColor,
                  (__bridge id)UIColor.blueColor.CGColor,
                  (__bridge id)UIColor.yellowColor.CGColor,
                  (__bridge id)UIColor.redColor.CGColor,
                  ];
    
    [self.redLayer addAnimation:ka forKey:nil];
//    self.redLayer.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1].CGColor;
    
//    [CATransaction commit];
}

/** UIView transaction */
- (IBAction)clickChangeFrameButton:(UIButton *)sender {
    
    [self p_transitionDemo];
   
    
}

- (void)p_setupBezierPath{
    /** 1. 添加路径 */
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, 150)];
    [path addCurveToPoint:CGPointMake(300, 150) controlPoint1:CGPointMake(75, 0) controlPoint2:CGPointMake(225, 300)];
    _path = path;
    /** 2. 添加CAShaperLayer */
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.path = path.CGPath;
    layer.fillColor = UIColor.clearColor.CGColor;
    layer.strokeColor = UIColor.redColor.CGColor;
    layer.lineWidth = 3.0f;
    [self.containerView.layer addSublayer:layer];
    /** 3. 添加运动Layer */
    CALayer *moveLayer = [CALayer layer];
    moveLayer.frame = CGRectMake(0, 150, 64, 64);
    moveLayer.position = CGPointMake(0, 150);
    moveLayer.anchorPoint = CGPointMake(0, 0.5);
    moveLayer.contents = (__bridge id)[UIImage imageNamed:@"ship"].CGImage;
    [self.containerView.layer addSublayer:moveLayer];
    _moveLayer = moveLayer;
    
}

- (void)p_setupUI{
    self.redLayer = [CALayer layer];
    self.redLayer.frame = CGRectInset(self.containerView.bounds, 30, 80);
    self.redLayer.backgroundColor = UIColor.redColor.CGColor;
    [self.containerView.layer addSublayer:self.redLayer];
    /** 隐式动画的转换效果 */
    CATransition *transition = [CATransition animation];
    transition.type = kCATransitionReveal;
    transition.subtype = kCATransitionFromLeft;
    self.redLayer.actions = @{@"backgroundColor":transition};
}

- (void)p_keyFrameDemo{
    /** 创建关键帧动画 */
    CAKeyframeAnimation *keyAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    keyAnimation.duration = 4.0f;
    keyAnimation.path = self.path.CGPath;
    keyAnimation.rotationMode = kCAAnimationRotateAuto;
    [self.moveLayer addAnimation:keyAnimation forKey:nil];
    
}

- (void)p_transitionDemo{
    NSArray *imageNames = @[@"icon_shangfen",@"icon_lianmeng"];
    static int index = 0;
    CATransition *transition = [CATransition animation];
    /**
     kCATransitionFade
     kCATransitionMoveIn
     kCATransitionPush
     kCATransitionReveal
     ---- 私有效果 -------
     pageCurl 向上翻一页
     pageUnCurl 向下翻一页
     rippleEffect 滴水效果
     suckEffect 收缩效果,如一块布被抽走
     cube 立方体效果
     oglFlip
     */
    transition.type = @"oglFlip";
    
    /**
     top,left,right,bottom;
     */
    transition.subtype = kCATransitionFromLeft;
    
    [self.imageView.layer addAnimation:transition forKey:nil];
    
//    self.imageView.image = [UIImage imageNamed:imageNames[index % 2]];
    self.imageView.image = [UIImage imageNamed:imageNames[0]];
    index++;
    
}
- (void)p_test{
    //    [self p_setupBezierPath];
    
    //add the ship
    CALayer *shipLayer = [CALayer layer];
    shipLayer.frame = CGRectMake(0, 0, 128, 128);
    shipLayer.position = CGPointMake(150, 150);
    shipLayer.contents = (__bridge id)[UIImage imageNamed:@"ship"].CGImage;
    [self.containerView.layer addSublayer:shipLayer];
    //animate the ship rotation
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"transform.rotation";
    animation.duration = 2.0;
    //    animation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI, 0, 0, 1)];
    animation.byValue = @(M_PI * 2); //[NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI, 0, 0, 1)];
    [shipLayer addAnimation:animation forKey:nil];
}

- (void)p_viewAnimation{
    [UIView beginAnimations:@"" context:nil];
    [UIView setAnimationDuration:5.0];
    
    CGFloat x = self.containerView.frame.origin.x;
    CGFloat y = self.containerView.frame.origin.y;
    CGFloat w = arc4random_uniform(30) + 20;
    CGFloat h = arc4random_uniform(30) + 30;
    
    self.containerView.frame = CGRectMake(x, y, w, h);
    [UIView commitAnimations];
}

- (void)p_graphCAMediaTimingFunc{


    //create timing function
    CAMediaTimingFunction *function = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    
    //get control points
    float controlPoint1[2], controlPoint2[2];
    [function getControlPointAtIndex:1 values:controlPoint1];
    [function getControlPointAtIndex:2 values:controlPoint2];
    //create curve
    UIBezierPath *path = [[UIBezierPath alloc] init];
    [path moveToPoint:CGPointZero];

    CGPoint cp1 = CGPointMake(controlPoint1[0], controlPoint1[1]);
    CGPoint cp2 = CGPointMake(controlPoint2[0], controlPoint2[1]);
    [path addCurveToPoint:CGPointMake(1, 1) controlPoint1:cp1 controlPoint2:cp2];
    //scale the path up to a reasonable size for display
    [path applyTransform:CGAffineTransformMakeScale(200, 200)];
    //create shape layer
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.strokeColor = [UIColor redColor].CGColor;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.lineWidth = 4.0f;
    shapeLayer.path = path.CGPath;
    [self.containerView.layer addSublayer:shapeLayer];
    //flip geometry so that 0,0 is in the bottom-left
    self.containerView.layer.geometryFlipped = YES;
}

@end


