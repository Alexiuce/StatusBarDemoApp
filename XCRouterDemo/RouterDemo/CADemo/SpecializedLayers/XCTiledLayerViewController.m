//
//  XCTitledLayerViewController.m
//  CADemo
//
//  Created by Alexcai on 2019/1/22.
//  Copyright © 2019 dongjiu. All rights reserved.
//

#import "XCTiledLayerViewController.h"

@interface XCTiledLayerViewController ()

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
    CGFloat tiledSize = 256.36;
    NSString *picturePath = [NSBundle.mainBundle pathForResource:@"Image/scrollImage" ofType:@"jpg"];
    //    NSString *outpath = [picturePath stringByDeletingPathExtension];
    //    NSArray *result = [pictureName stringsByAppendingPaths:@[@"-",@"@",@"#"]];
    //    NSArray *result = [picturePath pathComponents];
    UIImage *img = [UIImage imageWithContentsOfFile:picturePath];
    CGFloat t = ceil(tiledSize);
    NSLog(@"%f",t);
    NSString*hStr =@"你好啊";
    NSString*hString = [hStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"hString === %@",hString);
    NSString*str3 =@"\u5982\u4f55\u8054\u7cfb\u5ba2\u670d\u4eba\u5458\uff1f";
//    NSString*str5 = [str3 stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString*str5 = [str3 stringByRemovingPercentEncoding];
    
    NSLog(@"str5 ==== %@",str5);
    
   
    
}

@end
