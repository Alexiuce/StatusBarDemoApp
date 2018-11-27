//
//  XCRecentViewController.m
//  RouterDemo
//
//  Created by Alexcai on 2018/11/27.
//  Copyright © 2018 dongjiu. All rights reserved.
//

#import "XCRecentViewController.h"

@interface XCRecentViewController ()

@end

@implementation XCRecentViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"%s",__PRETTY_FUNCTION__);
    NSLog(@"normal button");
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"button");
    });
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSLog(@"%s",__FUNCTION__);
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSLog(@"%s",__FUNCTION__);
}
- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    NSLog(@"%s",__FUNCTION__);
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    NSLog(@"%s",__FUNCTION__);
}

@end
