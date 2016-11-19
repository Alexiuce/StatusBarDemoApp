//
//  SBPopViewController.m
//  StatusBarDemoApp
//
//  Created by Alexcai on 2016/11/12.
//  Copyright © 2016年 codeMaster. All rights reserved.
//

#import "SBPopViewController.h"

@interface SBPopViewController ()

@end

@implementation SBPopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}
- (IBAction)quit:(NSButton *)sender {
    
    [[NSApplication sharedApplication] terminate:self];
}

@end
