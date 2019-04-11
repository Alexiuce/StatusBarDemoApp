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

- (void)awakeFromNib{
    [super awakeFromNib];
    
    UIView *selectedView = [[UIView alloc]init];
    selectedView.alpha = 0.5;
    selectedView.backgroundColor = UIColor.redColor;
    self.selectedBackgroundView = selectedView;
    
}

- (void)setHighlighted:(BOOL)highlighted{
    [super setHighlighted:highlighted];
    if (highlighted) {
        self.selectedBackgroundView.alpha = 0.8;
    }else{
        self.selectedBackgroundView.alpha = 0.5;
    }
}

@end
