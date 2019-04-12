//
//  XCTwoController.m
//  RouterDemo
//
//  Created by Alexcai on 2019/4/4.
//  Copyright © 2019 dongjiu. All rights reserved.
//

#import "XCTwoController.h"
#import "FCRouter.h"

@interface XCTwoController ()

@end

@implementation XCTwoController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Two Controller";
}
- (IBAction)clickedButton:(UIButton *)sender {
    /** 调用注册的 block */
    [FCRouter.share matchHandleWithUrl:@"app://oneHandle" userInfo:@{@"a":@"hello",@"b": self.title}];
}

- (void)dealloc{
    NSLog(@"%s",__FUNCTION__);
}

@end
