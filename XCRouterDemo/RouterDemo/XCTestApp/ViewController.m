//
//  ViewController.m
//  XCTestApp
//
//  Created by Alexcai on 2018/12/25.
//  Copyright © 2018 dongjiu. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    /** 获取所有正在运行的app 信息 */
    NSArray *runingApp = NSWorkspace.sharedWorkspace.runningApplications;
    for (NSRunningApplication *app in runingApp) {
        NSLog(@"%@",app.localizedName);
    }
    
    // Do any additional setup after loading the view.
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end
