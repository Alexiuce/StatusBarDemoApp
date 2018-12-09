//
//  ViewController.m
//  UICollectionViewDemo
//
//  Created by Alexcai on 2018/12/6.
//  Copyright © 2018 dongjiu. All rights reserved.
//

#import "ViewController.h"
#import "XCViewCell.h"

static NSString *const ReusedKey = @"prefetch_cell";

@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDataSourcePrefetching>

@property (nonatomic, strong) NSArray *icons;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _icons = [@"🐍,👍,💄,🎏,🐠,🍔,🏩,🎈,🐷,👠,🐣,🐙,✈️,💅,⛑,👑,👛,🐝,🌂,🌻,🎼,🎧,🚧,📎,🍻" componentsSeparatedByString:@","];
    
    // Do any additional setup after loading the view, typically from a nib.
}


#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _icons.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    XCViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ReusedKey forIndexPath:indexPath];
    
    cell.iconLabel.text = self.icons[indexPath.item];
    
    return cell;
}

#pragma mark - UICollectionViewDataSourcePrefetching
- (void)collectionView:(UICollectionView *)collectionView prefetchItemsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths{
    
}
@end
