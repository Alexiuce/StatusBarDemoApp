//
//  XCMotionTableViewController.m
//  CADemo
//
//  Created by Alexcai on 2019/1/25.
//  Copyright © 2019 dongjiu. All rights reserved.
//

#import "XCMotionTableViewController.h"

@interface XCMotionTableViewController ()

@property (nonatomic, strong)NSArray <NSDictionary <NSString *,NSString *>*>*controllerTitles;

@end

@implementation XCMotionTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Motion";
    NSString *plistFile = [NSBundle.mainBundle pathForResource:@"XCMotionConfig" ofType:@"plist"];
    _controllerTitles = [NSArray arrayWithContentsOfFile:plistFile];
    self.view.backgroundColor = UIColor.whiteColor;
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _controllerTitles.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"xc_motion"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"xc_motion"];
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


@end
