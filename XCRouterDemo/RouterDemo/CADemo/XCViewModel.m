//
//  XCViewModel.m
//  CADemo
//
//  Created by Alexcai on 2018/12/11.
//  Copyright © 2018 dongjiu. All rights reserved.
//

#import "XCViewModel.h"

@implementation XCViewModel

+ (NSString *)randName{
    NSArray *first = @[@"Alex",@"Bob",@"Bill",@"Charles",@"Dan",@"Dave",@"Ethan",@"Frank"];
    NSArray *last = @[@"AppleSpeed",@"Bandicoot",@"Caravan",@"Dabble",@"Ernest",@"Fortune"];
    NSUInteger index1 = (rand() / (double)INT_MAX) *  first.count;
    NSUInteger index2 = (rand() / (double)INT_MAX) *  last.count;
    return [NSString stringWithFormat:@"%@ %@",first[index1],last[index2]];
}

+ (NSString *)randImageName{
    NSArray *imgName = @[@"icon_pipei",@"icon_datuan",@"icon_yule",@"icon_zhandui"];
    NSUInteger index = (rand() /(double) INT_MAX) * imgName.count;
    return [NSString stringWithFormat:@"%@@3x",imgName[index]];
}

@end
