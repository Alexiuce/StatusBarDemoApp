//
//  XCAppPresentViewController.m
//  RouterDemo
//
//  Created by Alexcai on 2018/11/26.
//  Copyright © 2018 dongjiu. All rights reserved.
//

#import "XCAppPresentViewController.h"

@interface XCAppPresentViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation XCAppPresentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self p_scroll];
    

}
#pragma mark - private method

- (void)p_scroll{
    for (int i = 0; i < 3; i++) {
        
        CGFloat x = 100 + i * 140;
        CGRect r = CGRectMake(x, 10, 80, 40);
        
        UIView *v = [[UIView alloc]initWithFrame:r];
        v.backgroundColor = UIColor.orangeColor;
        [self.scrollView addSubview:v];
    }
    self.scrollView.contentSize = CGSizeMake(1000, 0);
}

- (void)p_testDispatch{
    NSLog(@"%s",__FUNCTION__);
    NSLog(@"normal button");
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"button");
    });
}


- (IBAction)clickDismissButton:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - Delegate  <UIScrollViewDelegate>

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"bounds origin %@",NSStringFromCGPoint(scrollView.bounds.origin));
    NSLog(@"content off set %@",NSStringFromCGPoint(scrollView.contentOffset));
}
@end
