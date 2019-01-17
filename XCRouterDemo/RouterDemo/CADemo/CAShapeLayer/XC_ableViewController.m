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


@end
