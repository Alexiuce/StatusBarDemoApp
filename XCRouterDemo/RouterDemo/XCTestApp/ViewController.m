//
//  ViewController.m
//  XCTestApp
//
//  Created by Alexcai on 2018/12/25.
//  Copyright © 2018 dongjiu. All rights reserved.
//

#import "ViewController.h"
#import "XCObj.h"
@interface ViewController ()

@property (weak) IBOutlet NSTextField *userName;

@property (weak) IBOutlet NSSecureTextField *password;

@property (weak) IBOutlet NSTextField *infoLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    /** 获取所有正在运行的app 信息 */
//    NSArray *runingApp = NSWorkspace.sharedWorkspace.runningApplications;
//    for (NSRunningApplication *app in runingApp) {
//        NSLog(@"%@",app.localizedName);
//    }
    
    // Do any additional setup after loading the view.
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];
    XCObj *obj = (XCObj *)representedObject;
    NSLog(@"obj name == %@",obj.name);
    // Update the view, if already loaded.
}
- (IBAction)login:(NSButton *)sender {
    
    if ([self.userName.stringValue isEqualToString:@"alex"] && [self.password.stringValue isEqualToString:@"123"]) {
        NSLog(@"登录成功");
        self.infoLabel.stringValue = @"登录成功";
    }else{
        NSLog(@"登录失败");
        self.infoLabel.stringValue = @"登录失败";
    }
    
}


@end
