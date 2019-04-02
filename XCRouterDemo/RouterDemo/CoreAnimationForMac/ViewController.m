//
//  ViewController.m
//  CoreAnimationForMac
//
//  Created by Alexcai on 2019/3/22.
//  Copyright © 2019 dongjiu. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>

@interface ViewController ()
@property (weak) IBOutlet NSImageView *motoImageView;

@property (nonatomic, assign) NSRect startFrame;
@property (nonatomic, assign) NSRect endFrame;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _startFrame = NSMakeRect(0, 0, 177, 100);
    _endFrame = NSMakeRect(100, 100, 212, 120);

    self.motoImageView.frame = _startFrame;
    // Do any additional setup after loading the view.
//   [NSEvent addLocalMonitorForEventsMatchingMask:NSEventMaskKeyDown handler:^NSEvent * _Nullable(NSEvent * event) {
//        NSLog(@"key down....");
//        return event;
//    }];
    
    
    
}

- (void)viewDidAppear{
    [super viewDidAppear];
    NSLog(@"%@",self.view.nextResponder);
    NSLog(@"%@",self.nextResponder);
//    [NSApplication.sharedApplication.keyWindow setNextResponder:self];
//    [self setNextResponder:NSApp] ;
    NSLog(@"first responder = %@",NSApp.keyWindow.firstResponder);
    NSLog(@"key window = %@",NSApp.keyWindow);
//    BOOL isSuccess = [NSApp.keyWindow makeFirstResponder:self];
    
//    NSLog(@"%d",isSuccess);
//    NSLog(@"first responder = %@",NSApp.keyWindow.firstResponder);
}


//- (BOOL)resignFirstResponder{
//    return NO;
//}



- (void)keyDown:(NSEvent *)event{
    NSLog(@"%s",__FUNCTION__);
}
- (void)flagsChanged:(NSEvent *)event{
    NSLog(@"%s",__FUNCTION__);
    
}

- (void)mouseDown:(NSEvent *)event{
    NSLog(@"first responder = %@",NSApp.keyWindow.firstResponder);
    NSLog(@"%s",__FUNCTION__);
    
}

@end
