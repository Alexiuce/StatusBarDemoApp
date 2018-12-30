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
    rect.origin.x += 100;
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(300, 80), NO, UIScreen.mainScreen.scale);
    [UIColor.purpleColor setFill];
    [path fill];
    
    
    UIBezierPath *path2 = [UIBezierPath bezierPathWithOvalInRect:rect];
    [UIColor.redColor set];
    [path2 fill];
    
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    
    self.imgView.image = img;
    
}

@end
