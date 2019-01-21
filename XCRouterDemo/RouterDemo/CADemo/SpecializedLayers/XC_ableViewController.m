//
//  XCTableViewController.m
//  CADemo
//
//  Created by Alexcai on 2019/1/14.
//  Copyright © 2019 dongjiu. All rights reserved.
//

#import "XC_TableViewController.h"

@interface XC_TableViewController ()

@property (nonatomic, strong)NSArray <NSDictionary <NSString *,NSString *>*>*controllerTitles;

@end

@implementation XC_TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Specialized Layers";
    NSString *plistFile = [NSBundle.mainBundle pathForResource:@"XC_TabelViewControllerConfig" ofType:@"plist"];
    _controllerTitles = [NSArray arrayWithContentsOfFile:plistFile];
    /** 分解gif 图片 */
//    [self deCompositionGif];
}


#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _controllerTitles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"shape"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"shape"];
    }
    // Configure the cell...
    NSDictionary *dict = _controllerTitles[indexPath.row];
    cell.textLabel.text = dict[@"titleName"];
    return cell;
}
#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *dict = _controllerTitles[indexPath.row];
    NSString *controllerText = dict[@"controllerName"];
    UIViewController *controller = [[NSClassFromString(controllerText) alloc]init];
    controller.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:controller animated:YES];
    
}
#pragma mark - private method
-(void)deCompositionGif{
    NSString *gitpathSource = [[NSBundle mainBundle]pathForResource:@"音频" ofType:@"gif"];
    NSData *data =[NSData dataWithContentsOfFile:gitpathSource];
    CGImageSourceRef source = CGImageSourceCreateWithData((__bridge CFDataRef)data, NULL);
    //将gif分解成一帧帧
    size_t count = CGImageSourceGetCount(source);
    NSMutableArray *tmpArray =[[NSMutableArray alloc]init];
    for (size_t i = 0; i < count; i++) {
        CGImageRef imageref = CGImageSourceCreateImageAtIndex(source, i, NULL);
        //将单帧数据转化成Image
        UIImage *image = [UIImage imageWithCGImage:imageref scale:[UIScreen mainScreen].scale orientation:UIImageOrientationUp];
        [tmpArray addObject:image];
        CGImageRelease(imageref);
     }
    CFRelease(source);
    //前面两处释放是为了防止内存泄漏
    int i = 0;
    for (UIImage *image in tmpArray) {
        NSData *data = UIImagePNGRepresentation(image);
        //NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *gifPath = @"/Users/Alexcai/Desktop/demo/";//path[0];
        NSString *pathNum = [gifPath stringByAppendingString:[NSString stringWithFormat:@"vioce_gif_%d.png",i]];
        i++;
        [data writeToFile:pathNum atomically:NO];
    }
    
}
  

@end
