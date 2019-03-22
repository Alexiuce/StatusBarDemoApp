//
//  ViewController.m
//  CoreAnimationForMac
//
//  Created by Alexcai on 2019/3/22.
//  Copyright © 2019 dongjiu. All rights reserved.
//

#import "ViewController.h"

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
    NSLog(@"%d",self.acceptsFirstResponder);
    // Do any additional setup after loading the view.
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}
- (BOOL)acceptsFirstResponder{
    return YES;
}

- (void)keyDown:(NSEvent *)event{
    NSLog(@"%s",__func__);
}

@end
