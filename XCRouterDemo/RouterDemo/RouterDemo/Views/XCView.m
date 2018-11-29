//
//  XCView.m
//  RouterDemo
//
//  Created by Alexcai on 2018/11/29.
//  Copyright © 2018 dongjiu. All rights reserved.
//

#import "XCView.h"

@implementation XCView

- (void)setFrame:(CGRect)frame{
    [super setFrame:frame];
    NSLog(@"%@",NSStringFromCGRect(frame));
}

@end
