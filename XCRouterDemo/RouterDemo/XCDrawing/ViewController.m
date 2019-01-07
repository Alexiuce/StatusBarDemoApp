//
//  ViewController.m
//  XCDrawing
//
//  Created by Alexcai on 2018/12/30.
//  Copyright © 2018 dongjiu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    [self drawImage];
//    [self conversionDictionary];
    /** 整数化rect */
//    [self IntegralRect];
    /** 切割rect */
    [self rectDivide];
}
/** CGPoint convert dictionary*/
- (void)conversionDictionary{
    /** CGPoint 转换 NSDictionary */
    CGPoint p = {10,20};
    NSDictionary *dic = CFBridgingRelease(CGPointCreateDictionaryRepresentation(p));
    NSLog(@"%@",dic);
    CGPoint np;
    BOOL s = CGPointMakeWithDictionaryRepresentation((__bridge CFDictionaryRef)dic, &np);
    if (s) {
        NSLog(@"point form dict == %@",NSStringFromCGPoint(np));
    }
}
- (void)drawImage{
    
    CGRect rect = CGRectMake(0, 0, 80, 80);
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:rect];
    rect.origin.x += 60;
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(300, 80), NO, UIScreen.mainScreen.scale);
    [UIColor.purpleColor set];
    [path setLineWidth:10];
    [path stroke];
    
    
    UIBezierPath *path2 = [UIBezierPath bezierPathWithOvalInRect:rect];
    [[UIColor.redColor colorWithAlphaComponent:0.5] set];
    [path2 fill];
    
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    
    self.imgView.image = img;
    
}
/**
CGRectInset(rect, xinset, yinset)
 This function enables you to create a smaller or larger rectangle that’s centered on the same point as the source rectangle.
 Use a positive inset for smaller rectangles, negative for larger ones.
 This function is particularly useful for moving drawings and subimages away from view edges to provide whitespace breathing room.
 */

- (void)integralRect{
    
    /**  CGRectIntegral(rect)
     This function converts the source rectangle to integers.
     The origin values are rounded down from any fractional values to whole integers.The size is rounded upward.
     You are guaranteed that the new rectangle fully contains the original rectangle.
     Integral rectangles speed up and clarify your drawing.
     Views drawn exactly on pixel boundaries require less antialiasing and result in less blurry output.
     */
    CGRect r = {10.2,12.5, 20.8,19.8};
    CGRect nr = CGRectIntegral(r);
    NSLog(@"%@",NSStringFromCGRect(nr));  // 输出  {{10, 12}, {21, 21}}
}

- (void)rectDivide{
    /** CGRectDivide(rect, &sliceRect, &remainderRect, amount, edge)
     矩形分割;
     * rect : 需要拆分的矩形;
     * sliceRect: 分割出来的矩形;
     * remainderRect : rect被分割后的剩余部分;
     * amount : 需要分割的大小(水平方向分隔,代表宽度, 垂直方向代表高度);
     * edge : 分割的方向枚举值 CGRectMinXEdge, CGRectMinYEdge, CGRectMaxXEdge, and CGRectMaxYEdge.
    */
    
    CGRect r = {50, 50, 100,100};
    CGRect slice ,remaind;
    CGRectDivide(r, &slice, &remaind, 20, CGRectMaxXEdge);
    NSLog(@"slice frame %@",NSStringFromCGRect(slice));
    
    
}
@end
