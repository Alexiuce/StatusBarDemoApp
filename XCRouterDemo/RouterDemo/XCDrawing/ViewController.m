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


/** size 缩放 方法: 根据比例系数 返回一个新的size */
CGSize sizeByFactor(CGSize s, CGFloat factor){
    return CGSizeMake(s.width * factor, s.height * factor);
}

/** 计算合适的缩放比例 */
CGFloat aspectRatio(CGSize s, CGRect d){
    CGSize t = d.size;
    CGFloat ws = t.width / s.width;
    CGFloat hs = t.height / s.height;
    return MIN(ws, hs);
}
/** 计算 fitting 后的 CGRect */
CGRect rectByFittingInRect(CGSize s, CGRect d){
    /** 1. 计算比例 */
    CGFloat ratio = aspectRatio(s, d);
    /** 2. 根据比例计算 需要fitting 的 size */
    CGSize fittingSize = sizeByFactor(s, ratio);
    /** 3. 根据size 生成 CGRect: 中心点与目标的CGRect 相同 */
    CGFloat x = CGRectGetMidX(d) - fittingSize.width * 0.5;
    CGFloat y = CGRectGetMidY(d) - fittingSize.height * 0.5;
    return CGRectMake(x, y, fittingSize.width, fittingSize.height);
}
/** 输出 int 类型的在内存中的存储 */
void logMemoryBitNumber(int number){
    
    for (int i = 0; i < 32; i += 8) {
        int bit = number >>( 24 - i);
        int result = bit & 0xff;
        printf("%.2x ",result);
    }
}

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    [self drawImage];
//    [self conversionDictionary];
    /** 整数化rect */
//    [self IntegralRect];
    /** 切割rect */
//    [self rectDivide];
    /** fitting模式*/
//    [self fitingMode];
    
    NSString *text = @"Hello World";
    NSData *textData = [text dataUsingEncoding:NSUTF8StringEncoding];
    
    UIImage *img = [self imageFromData:textData];
    NSData *imgData = UIImagePNGRepresentation(img);
    NSString *imgText = [[NSString alloc]initWithData:imgData encoding:NSUTF8StringEncoding];
    NSLog(@"img text == %@",imgText);
    
    UIImage *icon = [UIImage imageNamed:@"icon_home_fish"];
    self.imgView.image = icon;
    
    NSData *iconData = UIImagePNGRepresentation(icon);
    const Byte *bytes = iconData.bytes;
    NSUInteger count = iconData.length;
    for (int i = 0; i < count ; ++i) {
        Byte result = bytes[i];
        printf("%.2x ",result);
        if (i != 0 && i % 8 == 0) {
            printf("\n");
        }
    }
    // 0x00007fd38f8a4a00
    // 00 4A 8A 8F D3 7F 00 00
//    int *d = (__bridge void *)iconData;
//    for (int i = 0; i < count; i++) {
//        d += i;
//        logMemoryBitNumber(*d);
//        if (i % 8) {
//            printf("\n");
//        }
//    }
}

- (UIImage *)imageFromData:(NSData *)data{
    
    if (data == nil) {return nil;}
    /** 获取数据总大小: 为了使用正方形,这步确保大小可以整除2, 即宽高相等  */
    NSUInteger totalSize = data.length % 2 ? data.length : data.length + 1;
    /** 计算宽高 : totalSize = width * height * 4 */
    int wh = (int)((totalSize % 4) ? (totalSize / 4) : (totalSize / 4) + 1);
    /** 创建颜色空间 */
    CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();
    if (colorSpaceRef == NULL) {return nil;}
    Byte *bytes = (Byte *) data.bytes;
    /** 创建位图上下文 */
    CGContextRef ctx = CGBitmapContextCreate(bytes, wh, wh,8, wh * 4, colorSpaceRef, kCGImageAlphaPremultipliedFirst);
    CGColorSpaceRelease(colorSpaceRef);
    if (ctx == NULL) {return  nil;}
    CGImageRef imgRef = CGBitmapContextCreateImage(ctx);
    CGContextRelease(ctx);
    UIImage *img = [UIImage imageWithCGImage:imgRef];
    CGImageRelease(imgRef);
    return img;
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
/** fiting 适配模式 */
- (void)fitingMode{
    CGRect dest = {0,0, 100,100};
    CGSize sourceSize = {40,20};
    CGRect fittingRect = rectByFittingInRect(sourceSize, dest);
    NSLog(@"fitting rect == %@",NSStringFromCGRect(fittingRect));
}



@end

