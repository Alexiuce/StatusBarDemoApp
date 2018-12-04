//
//  XCPerson.m
//  XCUnitTest
//
//  Created by Alexcai on 2018/12/4.
//  Copyright © 2018 dongjiu. All rights reserved.
//

#import "XCPerson.h"

@implementation XCPerson

+ (instancetype)person{
    return [[self alloc]init];
}


- (instancetype)init{
    if (self = [super init]) {
        self.age = arc4random_uniform(100) + 1;
        self.name = @(arc4random_uniform(123)).stringValue;
    }
    return self;
}

@end
