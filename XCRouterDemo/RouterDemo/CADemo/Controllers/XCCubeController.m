//
//  XCCubeController.m
//  CADemo
//
//  Created by Alexcai on 2019/1/2.
//  Copyright © 2019 dongjiu. All rights reserved.
//

#import "XCCubeController.h"
#import <GLKit/GLKit.h>


#define LIGHT_DIRECTION 0, 1, -0.5

static CGFloat const AMBIENT_LIGHT = 0.5;

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
    
    perspective = CATransform3DRotate(perspective, -M_PI_4, 1, 0, 0);
    perspective = CATransform3DRotate(perspective, -M_PI_4, 0, 1, 0);
    
    self.containerView.layer.sublayerTransform = perspective;
    /** 添加face (立方体的正面)*/
    CATransform3D transform = CATransform3DMakeTranslation(0, 0, 55);
    [self addFace:0 transform:transform];
    /** 添加立方体的右侧面*/
    transform = CATransform3DMakeTranslation(55, 0, 0);
    transform = CATransform3DRotate(transform,M_PI_2, 0, 1, 0);
    [self addFace:1 transform:transform];
    /** 添加立方体的顶部面 */
    transform = CATransform3DMakeTranslation(0, -55, 0);
    transform =  CATransform3DRotate(transform,M_PI_2, 1, 0, 0);
    [self addFace:2 transform:transform];

    /** 添加立方体的底部面 */
    transform = CATransform3DMakeTranslation(0, 55, 0);
    transform =  CATransform3DRotate(transform,-M_PI_2, 1, 0, 0);
    [self addFace:3 transform:transform];
    /** 添加立方体的左侧面 */
    transform = CATransform3DMakeTranslation(-55, 0, 0);
    transform =  CATransform3DRotate(transform,-M_PI_2, 0, 1, 0);
    [self addFace:4 transform:transform];
    /** 添加立方体的背部面 */
    transform = CATransform3DMakeTranslation(0, 0, -55);
    transform = CATransform3DRotate(transform, M_PI, 0, 1, 0);
    [self addFace:5 transform:transform];
    
    
}


- (IBAction)clickButton:(UIButton *)sender {
    NSLog(@"%s",__func__);
}

#pragma mark - private method


- (void)addFace:(NSUInteger)index transform:(CATransform3D)trans{
    UIView *face = self.faces[index];
    [self.containerView addSubview:face];
    CGSize containerSize = self.containerView.bounds.size;
    face.center = CGPointMake(containerSize.width * 0.5, containerSize.height * 0.5);
    face.layer.transform = trans;
    
    /** 添加光照效果 */
    [self addLightingToFace:face.layer];
}


- (void)addLightingToFace:(CALayer *)face{
    CALayer *layer = [CALayer layer];
    layer.frame = face.bounds;
    [face addSublayer:layer];
    
    //(GLKMatrix4 has the same structure as CATransform3D)

    CATransform3D transform = face.transform;

    GLKMatrix4 matrix4 = *(GLKMatrix4 *)&transform;

    GLKMatrix3 matrix3 = GLKMatrix4GetMatrix3(matrix4);


    //get face normal
    GLKVector3 normal = GLKVector3Make(0, 0, 1);
    normal = GLKMatrix3MultiplyVector3(matrix3, normal);
    normal = GLKVector3Normalize(normal);

    //get dot product with light direction
    GLKVector3 light = GLKVector3Normalize(GLKVector3Make(LIGHT_DIRECTION));
    float dotProduct = GLKVector3DotProduct(light, normal);

    
    
//    /** GLK (GLKMatrix4 has the same structure as CATransform3D) */
//    CATransform3D transform = face.transform;
//    GLKMatrix4 matrix4 = *(GLKMatrix4*)&transform;
//    GLKMatrix3 matrix3 = GLKMatrix4GetMatrix3(matrix4);
//    /** 计算正常lighting */
//    GLKVector3 normal = GLKVector3Make(0, 0, 1);
//    normal = GLKMatrix3MultiplyVector3(matrix3, normal);
//    normal = GLKVector3Normalize(normal);
//
//    /** 光源点 */
//    GLKVector3 light = GLKVector3Normalize(GLKVector3Make(LIGHT_DIRECTION));
//    float dotProduct = GLKVector3DotProduct(light, normal);
    /** 设置亮度 */

    CGFloat shadow = 1 + dotProduct - AMBIENT_LIGHT;
    UIColor *lightColor = [UIColor colorWithWhite:0 alpha:shadow];
    layer.backgroundColor = lightColor.CGColor;
    
}
@end
