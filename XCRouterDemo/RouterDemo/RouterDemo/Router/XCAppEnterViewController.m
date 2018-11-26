//
//  XCAppEnterViewController.m
//  RouterDemo
//
//  Created by Alexcai on 2018/11/26.
//  Copyright © 2018 dongjiu. All rights reserved.
//

#import "XCAppEnterViewController.h"

@interface XCAppEnterViewController ()

@end

@implementation XCAppEnterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.orangeColor;
    NSLog(@"%s",__FUNCTION__);
    for (int i = 0; i < 100; i++) {
        NSLog(@"click ......%d",i);
    }
    
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
