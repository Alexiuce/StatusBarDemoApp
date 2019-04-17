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
    NSString *serverPath = @"https://www.tianqiapi.com/api/?version=v1";
    NSURL *url = [[NSURL alloc]initWithString:serverPath];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:NSURLSessionConfiguration.defaultSessionConfiguration];
    
    NSURLSessionDataTask *dt = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
        NSLog(@"dict = %@",dict);
        NSLog(@"responde = %@",response);
    }];
    [dt resume];
}
- (IBAction)quit:(NSButton *)sender {
    
    [[NSApplication sharedApplication] terminate:self];
}

@end
