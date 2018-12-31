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
    [self drawImage];
}

- (void)drawImage{
    
    CGRect rect = CGRectMake(0, 0, 80, 80);
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:rect];
    rect.origin.x += 60;
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(300, 80), YES, UIScreen.mainScreen.scale);
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
