//
//  XCCubeController.m
//  CADemo
//
//  Created by Alexcai on 2019/1/2.
//  Copyright © 2019 dongjiu. All rights reserved.
//

#import "XCCubeController.h"

@interface XCCubeController ()
@property (weak, nonatomic) IBOutlet UIView *containerView;

@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *faces;


@end

@implementation XCCubeController

- (void)viewDidLoad{
    [super viewDidLoad];
    /** 统一设置所有sublayer 的 公共 transform 属性 */
    CATransform3D perspective = CATransform3DIdentity;
    perspective.m34 = - 1.0 / 500;
    self.containerView.layer.sublayerTransform = perspective;
    /** 添加face (立方体的正面)*/
    CATransform3D transform = CATransform3DMakeTranslation(0, 0, 100);
    [self addFace:0 transform:transform];
    
    
    
  
}



#pragma mark - private method


- (void)addFace:(NSUInteger)index transform:(CATransform3D)trans{
    UIView *face = self.faces[index];
    [self.containerView addSubview:face];
    CGSize containerSize = self.containerView.bounds.size;
    face.center = CGPointMake(containerSize.width * 0.5, containerSize.height * 0.5);
    face.layer.transform = trans;
}
@end
