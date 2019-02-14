//
//  XCTimeProtocolViewController.m
//  CADemo
//
//  Created by Alexcai on 2019/2/14.
//  Copyright © 2019 dongjiu. All rights reserved.
//

#import "XCTimeProtocolViewController.h"

@interface XCTimeProtocolViewController ()

@end

@implementation XCTimeProtocolViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = NSStringFromClass(self.class);
    self.view.backgroundColor = UIColor.whiteColor;
    [self qrCodeImageDemo];
}


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
