//
//  XCResponseWindowController.m
//  CoreAnimationForMac
//
//  Created by Alexcai on 2019/3/22.
//  Copyright © 2019 dongjiu. All rights reserved.
//

#import "XCResponseWindowController.h"

@implementation XCResponseWindowController

//- (void)keyDown:(NSEvent *)event{
//    NSLog(@"%s",__FUNCTION__);
//    NSLog(@"view nextResponder =%@",self.window.contentViewController.view.nextResponder);
//    NSLog(@"window content controller nextResponder =%@",self.window.contentViewController.nextResponder);
//    NSLog(@"window nextResponder = %@",self.window.nextResponder);
//    NSLog(@"window controller nextResponder =%@",self.nextResponder);
//}


- (void)noResponderFor:(SEL)eventSelector{
    NSLog(@"%@",NSStringFromSelector(eventSelector));
}
@end
