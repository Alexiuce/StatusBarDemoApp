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
    [self conversionDictionary];
}
/** CGPoint convert dictionary*/
- (void)conversionDictionary{
    /** CGPoint 转换 NSDictionary */
    CGPoint p = {10,20};
    NSDictionary *dic = CFBridgingRelease(CGPointCreateDictionaryRepresentation(p));
    NSLog(@"%@",dic);
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

@end
