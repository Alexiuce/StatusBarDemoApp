//
//  XCTitledLayerViewController.m
//  CADemo
//
//  Created by Alexcai on 2019/1/22.
//  Copyright © 2019 dongjiu. All rights reserved.
//

#import "XCTiledLayerViewController.h"

@interface XCTiledLayerViewController ()<CALayerDelegate>

@property (nonatomic, strong)UIImage *picture;
@property (nonatomic, weak) CATiledLayer *tileLayer;

@end

@implementation XCTiledLayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = NSStringFromClass(self.class);
    self.view.backgroundColor = UIColor.whiteColor;
    [self tiledImageDemo];
}

/** 将大图 分解为多个小图 : 瓦片化 */
- (void)tiledImageDemo{
    NSString *picturePath = [NSBundle.mainBundle pathForResource:@"Image/scrollImage" ofType:@"jpg"];
    //    NSString *outpath = [picturePath stringByDeletingPathExtension];
    //    NSArray *result = [pictureName stringsByAppendingPaths:@[@"-",@"@",@"#"]];
    //    NSArray *result = [picturePath pathComponents];
    UIImage *img = [UIImage imageWithContentsOfFile:picturePath];
    self.picture = img;
    CATiledLayer *layer = [CATiledLayer layer];
    layer.delegate = self;
    layer.frame = CGRectMake(0, 0, img.size.width, img.size.height);
    [self.view.layer addSublayer:layer];
    self.tileLayer = layer;
//    [layer setNeedsDisplay];
    
}
#pragma mark - CALayerDelegate
- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx{
    CGRect rect = {0,0, 100,100};
    [self.picture drawInRect:rect];
}

#pragma mark - test demo
- (void)testDemo{
    CGFloat t = ceil(23.43);
    NSLog(@"%f",t);
    NSString*hStr =@"你好啊";
    NSString*hString = [hStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"hString === %@",hString);
    NSString*str3 =@"\u5982\u4f55\u8054\u7cfb\u5ba2\u670d\u4eba\u5458\uff1f";
    //    NSString*str5 = [str3 stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString*str5 = [str3 stringByRemovingPercentEncoding];
    
    NSLog(@"str5 ==== %@",str5);
}


#pragma dealloc
- (void)dealloc{
    self.tileLayer.delegate = nil;
}
@end
