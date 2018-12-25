//
//  XCViewCell.m
//  UICollectionViewDemo
//
//  Created by Alexcai on 2018/12/6.
//  Copyright © 2018 dongjiu. All rights reserved.
//

#import "XCViewCell.h"

@implementation XCViewCell

- (void)prepareForReuse{
    [super prepareForReuse];
    NSLog(@"old text === %@",self.iconLabel.text);
}

@end
