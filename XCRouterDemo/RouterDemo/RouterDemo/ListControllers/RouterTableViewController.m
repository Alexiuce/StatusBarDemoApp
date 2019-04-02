//
//  RouterTableViewController.m
//  RouterDemo
//
//  Created by Alexcai on 2019/4/2.
//  Copyright © 2019 dongjiu. All rights reserved.
//

#import "RouterTableViewController.h"
#import "FCRouter.h"

@interface RouterTableViewController ()

@end

@implementation RouterTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [FCRouter.share regsiterUrl:@"app://enter/" mapViewControllerClass:UIViewController.class];
}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"reuseIdentifier"];
    }
    // Configure the cell...
    cell.textLabel.text = @(indexPath.row).stringValue;

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%zd",indexPath.row);
    
    UIViewController *vc = [FCRouter.share matchViewControllerWithUrl:@"app://enter"];
    NSLog(@"vc = %@",vc);
    
}

@end
