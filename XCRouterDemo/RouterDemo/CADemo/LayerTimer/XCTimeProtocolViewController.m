//
//  XCTimeProtocolViewController.m
//  CADemo
//
//  Created by Alexcai on 2019/2/14.
//  Copyright © 2019 dongjiu. All rights reserved.
//

#import "XCTimeProtocolViewController.h"

@interface XCTimeProtocolViewController ()<CAAnimationDelegate>

@property (nonatomic, weak) UITextField *durationField;
@property (nonatomic, weak) UITextField *repeatCountField;
@property (nonatomic, weak) UIButton *startButton;
@property (nonatomic, weak) CALayer *layer;

@end

@implementation XCTimeProtocolViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = NSStringFromClass(self.class);
    self.view.backgroundColor = UIColor.whiteColor;
    [self durationAndRepreatCountDemo];
}

#pragma mark Duration & RepeatCount

- (void)durationAndRepreatCountDemo{
    UIView *lineView = [[UIView alloc]init];
    lineView.backgroundColor = UIColor.lightGrayColor;
    lineView.frame = CGRectMake(0,0 , self.view.bounds.size.width, 250);
    [self.view addSubview:lineView];
    
    CALayer *redLayer = [CALayer layer];
    redLayer.backgroundColor = UIColor.redColor.CGColor;
    redLayer.frame = (CGRect){0,0,50,50};
    redLayer.position = (CGPoint){150,120};
    [self.view.layer addSublayer:redLayer];
    self.layer = redLayer;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = UIColor.blueColor;
    btn.frame = CGRectMake(self.view.bounds.size.width - 80, 200, 70, 30);
    [btn setTitle:@"Strat" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(clickStartButtonEvent:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    self.startButton = btn;
    
    UILabel *durationLabel = [[UILabel alloc]init];
    durationLabel.text = @"Duration:";
    durationLabel.frame = (CGRect){10,180,80,20};
    [self.view addSubview:durationLabel];
    
    UITextField *durationField = [[UITextField alloc]init];
    durationField.borderStyle = UITextBorderStyleRoundedRect;
    durationField.frame = (CGRect){140, 180, 80, 20};
    [self.view addSubview:durationField];
    self.durationField = durationField;
    
    UILabel *repeatLabel = [[UILabel alloc]init];
    repeatLabel.text = @"RepeatCount:";
    repeatLabel.frame = (CGRect){10,220,120,20};
    [self.view addSubview:repeatLabel];
    
    UITextField *repeatField = [[UITextField alloc]init];
    repeatField.borderStyle = UITextBorderStyleRoundedRect;
    repeatField.frame = (CGRect){140, 220, 80, 20};
    [self.view addSubview:repeatField];
    self.repeatCountField = repeatField;
    
}

#pragma mark IBAction
- (void)clickStartButtonEvent:(UIButton *)btn{
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"transform.rotation";
    animation.byValue = @(M_PI * 2);
    animation.duration = self.durationField.text.doubleValue;
    animation.repeatCount = self.repeatCountField.text.floatValue;
    animation.delegate = self;
    [self.layer addAnimation:animation forKey:nil];
    btn.enabled = NO;
}
#pragma mark CAAnimation Delegate
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    self.startButton.enabled = flag;
}

#pragma mark Touch Event
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}
#pragma mark QR Code Image
- (void)qrCodeImageDemo{
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    [filter setDefaults];
    NSData *data = [@"TEXT ME 哈哈" dataUsingEncoding:NSUTF8StringEncoding];
    [filter setValue:data forKey:@"inputMessage"];
    
    CIImage *img = filter.outputImage;
    UIImageView *imgView = [[UIImageView alloc]init];
    imgView.frame = (CGRect){100,150,200,200};
    imgView.image = [UIImage imageWithCIImage:img];
    [self.view addSubview:imgView];
    
    
    [filter setValue:@"H" forKey:@"inputCorrectionLevel"];
    CIImage *hi_img = filter.outputImage;
    
    UIImageView *hi_imageView = [[UIImageView alloc]init];
    hi_imageView.frame = CGRectOffset(imgView.frame, 0, 250);
    hi_imageView.image = [UIImage imageWithCIImage:hi_img];
    [self.view addSubview:hi_imageView];
    
    
    UIImageView *hightest_imgView = [[UIImageView alloc]init];
    hightest_imgView.frame = CGRectOffset(hi_imageView.frame, 0, 250);
    [self.view addSubview:hightest_imgView];
    hightest_imgView.image = [self createNonInterpolatedUIImageFormCIImage:img withSize:200];
    
    
}


- (UIImage *)createNonInterpolatedUIImageFormCIImage:(CIImage *)image withSize:(CGFloat) size{
    CGRect extent = CGRectIntegral(image.extent);
    CGFloat scale = MIN(size/CGRectGetWidth(extent), size/CGRectGetHeight(extent));
    // 1.创建bitmap;
    size_t width = CGRectGetWidth(extent) * scale;
    size_t height = CGRectGetHeight(extent) * scale;
    CGColorSpaceRef cs = CGColorSpaceCreateDeviceGray();
    CGContextRef bitmapRef = CGBitmapContextCreate(nil, width, height, 8, 0, cs,(CGBitmapInfo)kCGImageAlphaNone);
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef bitmapImage = [context createCGImage:image fromRect:extent];
    CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationNone);
    CGContextScaleCTM(bitmapRef, scale, scale);
    CGContextDrawImage(bitmapRef, extent, bitmapImage);
    // 2.保存bitmap到图片
    CGImageRef scaledImage = CGBitmapContextCreateImage(bitmapRef);
    CGContextRelease(bitmapRef);
    CGImageRelease(bitmapImage);
    return [UIImage imageWithCGImage:scaledImage];
    
}
@end
