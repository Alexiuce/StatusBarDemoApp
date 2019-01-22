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
    
}

@end
