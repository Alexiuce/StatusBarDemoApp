//
//  XCImplictViewController.m
//  CADemo
//
//  Created by Alexcai on 2019/1/25.
//  Copyright © 2019 dongjiu. All rights reserved.
//

#import "XCImplictViewController.h"

@interface XCImplictViewController ()

@end

@implementation XCImplictViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = NSStringFromClass(self.class);
    self.view.backgroundColor = UIColor.whiteColor;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
