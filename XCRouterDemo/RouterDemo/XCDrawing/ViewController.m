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
    [self IntegralRect];
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

- (void)IntegralRect{
    CGRect r = {10.2,12.5, 20.8,19.8};
    CGRect nr = CGRectIntegral(r);
    NSLog(@"%@",NSStringFromCGRect(nr));  // 输出  {{10, 12}, {21, 21}}
}
@end
