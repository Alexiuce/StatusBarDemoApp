//
//  XCTimeTableViewController.m
//  CADemo
//
//  Created by Alexcai on 2019/2/14.
//  Copyright © 2019 dongjiu. All rights reserved.
//

#import "XCTimeTableViewController.h"

@interface XCTimeTableViewController ()

@property (nonatomic, strong)NSArray <NSDictionary <NSString *,NSString *>*>*controllerTitles;

@end

@implementation XCTimeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Layer Time";
    NSString *plistFile = [NSBundle.mainBundle pathForResource:@"XCTimeConfig" ofType:@"plist"];
    _controllerTitles = [NSArray arrayWithContentsOfFile:plistFile];
    
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _controllerTitles.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"timeLayer"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"timeLayer"];
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
