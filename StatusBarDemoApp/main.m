//
//  main.m
//  StatusBarDemoApp
//
//  Created by Alexcai on 2016/11/10.
//  Copyright © 2016年 codeMaster. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#import "AppDelegate.h"


int main(int argc, const char * argv[]) {
    NSApplication *app = [NSApplication sharedApplication];
     id delegate = [[AppDelegate alloc]init];
    app.delegate = delegate;
    
    return NSApplicationMain(argc, argv);
}
