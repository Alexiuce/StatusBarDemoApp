//
//  XCTableViewController.m
//  CADemo
//
//  Created by Alexcai on 2019/1/14.
//  Copyright © 2019 dongjiu. All rights reserved.
//

#import "XC_TableViewController.h"
#import "XC_TableViewHeader.h"

@interface XC_TableViewController ()

@property (nonatomic, strong)NSArray <NSString *>*controllerTitles;

@end

@implementation XC_TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Specialized Layers";
    // Uncomment the following line to preserve selection between presentations.
     self.clearsSelectionOnViewWillAppear = NO;
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
//     self.navigationItem.rightBarButtonItem = self.editButtonItem;
    _controllerTitles = @[kShapeViewController,
                          kTextViewController,
                          kTransformViewController,
                          kGradientViewController
                          ];
   
    
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
    cell.textLabel.text = _controllerTitles[indexPath.row];
    return cell;
}
#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *text = _controllerTitles[indexPath.row];
    NSString *controllerText = k_mapViewControllerString(text);
    UIViewController *controller = [[NSClassFromString(controllerText) alloc]init];
     self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:controller animated:YES];
    
}


@end
