//
//  RouterTableViewController.m
//  RouterDemo
//
//  Created by Alexcai on 2019/4/2.
//  Copyright © 2019 dongjiu. All rights reserved.
//

#import "RouterTableViewController.h"
#import "XCOneController.h"

@interface RouterTableViewController ()

@end

@implementation RouterTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
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

    XCOneController *vc = [XCOneController new];
    [self.navigationController pushViewController:vc animated:YES];
   
  
    
}

@end
