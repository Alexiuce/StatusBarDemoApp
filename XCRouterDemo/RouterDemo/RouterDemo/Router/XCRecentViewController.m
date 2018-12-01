//
//  XCRecentViewController.m
//  RouterDemo
//
//  Created by Alexcai on 2018/11/27.
//  Copyright © 2018 dongjiu. All rights reserved.
//

#import "XCRecentViewController.h"

@interface XCRecentViewController ()

@end

@implementation XCRecentViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self p_replicatorLayer];
    
}


#pragma mark - GCD test

- (void)p_replicatorLayer{
    CAReplicatorLayer *repLay = [CAReplicatorLayer layer];
    repLay.backgroundColor = UIColor.grayColor.CGColor;
    repLay.frame = CGRectMake(10, 300, 300, 200);
    
    
    
    repLay.instanceTransform = CATransform3DMakeTranslation(30, 0, 0);
    repLay.instanceCount = 3;
    
    CALayer *subLayer = [CALayer layer];
    subLayer.frame = CGRectMake(0, 0, 20, 40);
    subLayer.anchorPoint = CGPointZero;
    subLayer.backgroundColor = UIColor.redColor.CGColor;
    [repLay addSublayer:subLayer];
    
    [self.view.layer addSublayer:repLay];
}

- (void)p_shapeLayer{
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(100, 100)];
    [path addLineToPoint:CGPointMake(150, 250)];
    
    CAShapeLayer *sl = [CAShapeLayer layer];
    sl.lineWidth = 10;
    sl.strokeColor = UIColor.blueColor.CGColor;
    sl.path = path.CGPath;
    [self.view.layer addSublayer:sl];
}

/** set_target_queue */
- (void)p_testForGCD{
    
//    DISPATCH_QUEUE_CONCURRENT
    // DISPATCH_QUEUE_SERIAL == NULL
    
    dispatch_queue_t q1 = dispatch_queue_create("com.alexiuc.github",DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(q1, ^{
        NSLog(@"q1  doing....%@",NSThread.currentThread);
    });
    dispatch_async(q1, ^{
            NSLog(@"t1 .....");
    });
    dispatch_async(q1, ^{
        NSLog(@"t2.....");
    });
    dispatch_async(q1, ^{
        NSLog(@"t3.....");
    });
    
//    dispatch_queue_t q3 = dispatch_queue_create("com.aaa.github", NULL);
//    dispatch_async(q3, ^{
//        NSLog(@"q3 diong.....%@",NSThread.currentThread);
//    });
//
//    dispatch_async(q3, ^{
//        NSLog(@" q3 ...2.....");
//    });
//    dispatch_async(q3, ^{
//        NSLog(@"q3... 3.....");
//    });
//
//
//    dispatch_queue_t q4 = dispatch_queue_create("com.aaa.github", NULL);
//    dispatch_async(q4, ^{
//        NSLog(@"q4 diong.....%@",NSThread.currentThread);
//    });
//
//    dispatch_queue_t q5 = dispatch_queue_create("com.aaa.github", NULL);
//    dispatch_async(q5, ^{
//        NSLog(@"q5 diong.....%@",NSThread.currentThread);
//    });
//
//    dispatch_queue_t q6 = dispatch_queue_create("com.aaa.github", NULL);
//    dispatch_async(q6, ^{
//        NSLog(@"q6 diong.....%@",NSThread.currentThread);
//    });
    
//    dispatch_queue_t q2 = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
//    dispatch_set_target_queue(q1, q2);
    
}

- (void)p_testDispatchMain{
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"Hello main ");
    });
    for (int i = 0; i < 100; i++) {
        NSLog(@"%d",i);
    }
}
#pragma mark - IBAction

- (IBAction)clickGCDButton:(UIButton *)sender {
//     [self p_testForGCD];
    [self p_testDispatchMain];
}
@end
