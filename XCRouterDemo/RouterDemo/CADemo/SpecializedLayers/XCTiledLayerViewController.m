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
    CGFloat tiledSize = 256;
    NSString *pictureName = @"abc/png/123.jpg";
    NSString *outpath = [pictureName stringByStandardizingPath];
//    NSArray *result = [pictureName stringsByAppendingPaths:@[@"-",@"@",@"#"]];
    NSArray *result = [pictureName pathComponents];
    
    NSLog(@"%@  - %@",outpath,result);
}

@end
