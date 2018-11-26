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
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"before button");
    });
    NSLog(@"before did load ....");
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.orangeColor;
    NSLog(@"%s",__FUNCTION__);
   
    
    NSLog(@"normal button");
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"button");
    });

    dispatch_async(dispatch_get_main_queue(), ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"--- inner button----");
        });
    });
    
//    dispatch_async(dispatch_get_main_queue(), ^{
//        NSLog(@"-------button1");
//        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//        [self.view addSubview:btn];
//
//    });
//    for (int i = 0; i < 10; i++) {
//        dispatch_async(dispatch_get_main_queue(), ^{
//            NSLog(@"-------button ----- %d",i);
//            dispatch_async(dispatch_get_main_queue(), ^{
//                NSLog(@"inner main queue");
//            });
//        });
//    }
   
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSLog(@"%s",__FUNCTION__);
    _Pragma("message \"FIXME: ADF ADSF ASDFASD FASDF \"")
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
