//
//  XCScrollLayerViewController.m
//  CADemo
//
//  Created by Alexcai on 2019/1/19.
//  Copyright © 2019 dongjiu. All rights reserved.
//

#import "XCScrollLayerViewController.h"

@interface XCScrollLayerViewController ()

@property (nonatomic, weak) CAScrollLayer *scrollLayer;


@property (nonatomic, assign) CGPoint beginPoint;
@property (nonatomic, assign) CGPoint currentPoint;

@end

@implementation XCScrollLayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = NSStringFromClass(self.class);
    self.view.backgroundColor = UIColor.whiteColor;
    [self scrollLayerDemo];
}

- (void)scrollLayerDemo{
    CAScrollLayer *sl = [CAScrollLayer layer];
    sl.backgroundColor = UIColor.lightGrayColor.CGColor;
    sl.frame = CGRectMake(100, 150, 200, 200);
    [self.view.layer addSublayer:sl];
    
    NSString *picturePath = [NSBundle.mainBundle pathForResource:@"Image/scrollImage" ofType:@"jpg"];
    //    UIImage *img = [UIImage imageNamed:@"scrollImage.jpg"];
    UIImage *img = [UIImage imageWithContentsOfFile:picturePath];
    
    CALayer *imageLayer = [CALayer layer];
    imageLayer.frame = CGRectMake(0, 0, img.size.width, img.size.height);
    imageLayer.contents = (__bridge id _Nullable)(img.CGImage);
    [sl addSublayer:imageLayer];
    self.scrollLayer = sl;
    /** 设置滚动位置*/
    [sl scrollToPoint:CGPointMake(150, 150)];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.beginPoint = [[touches anyObject] locationInView:self.view];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *t = [touches anyObject];
    CGPoint location = [t locationInView:self.view];
    
    CGFloat deltaX = location.x + self.beginPoint.x;
    CGFloat deltaY = location.y + self.beginPoint.y;
    
    CGPoint p = CGPointMake(self.currentPoint.x + deltaX, self.currentPoint.y + deltaY);
    [self.scrollLayer scrollToPoint:p];
    self.currentPoint = p;
  
    
}
@end
