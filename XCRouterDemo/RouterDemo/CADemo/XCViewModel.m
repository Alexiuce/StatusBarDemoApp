//
//  XCViewModel.m
//  CADemo
//
//  Created by Alexcai on 2018/12/11.
//  Copyright © 2018 dongjiu. All rights reserved.
//

#import "XCViewModel.h"

@implementation XCViewModel

- (NSString *)randName{
    NSArray *first = @[@"Alex",@"Bob",@"Bill",@"Charles",@"Dan",@"Dave",@"Ethan",@"Frank"];
    NSArray *last = @[@"AppleSpeed",@"Bandicoot",@"Caravan",@"Dabble",@"Ernest",@"Fortune"];
    NSUInteger index1 = (rand() / (double)INTMAX_MAX) *  first.cout;
    NSUInteger index2 = (rand() / (double)INTMAX_MAX) *  first.cout;
    
    
}

@end
