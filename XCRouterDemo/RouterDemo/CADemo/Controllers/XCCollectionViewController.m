//
//  XCCollectionViewController.m
//  CADemo
//
//  Created by Alexcai on 2018/12/13.
//  Copyright © 2018 dongjiu. All rights reserved.
//

#import "XCCollectionViewController.h"
#import "XCImageIOCollectionViewCell.h"

@interface XCCollectionViewController ()<UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (nonatomic, strong) NSArray <NSString *>*imagePaths;

@end

@implementation XCCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imagePaths = [NSBundle.mainBundle pathsForResourcesOfType:@"png" inDirectory:@"Image"];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 100;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    XCImageIOCollectionViewCell *cell =  [collectionView dequeueReusableCellWithReuseIdentifier:@"imageIO" forIndexPath:indexPath];
    NSUInteger index = indexPath.item % 4;
    NSString *imagePath = self.imagePaths[index];
    cell.imageView.image = [UIImage imageWithContentsOfFile:imagePath];
    
    return cell;
}
@end
