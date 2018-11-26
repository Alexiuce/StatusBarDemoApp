//
//  XCAppPresentViewController.m
//  RouterDemo
//
//  Created by Alexcai on 2018/11/26.
//  Copyright © 2018 dongjiu. All rights reserved.
//

#import "XCAppPresentViewController.h"

@interface XCAppPresentViewController ()

@end

@implementation XCAppPresentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"%s",__FUNCTION__);
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)clickDismissButton:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
