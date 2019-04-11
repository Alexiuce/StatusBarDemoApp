//
//  XCOneController.m
//  RouterDemo
//
//  Created by Alexcai on 2019/4/4.
//  Copyright © 2019 dongjiu. All rights reserved.
//

#import "XCOneController.h"
#import "FCRouter.h"

#define XCBasePath "C:home//"

#define XCAT @
#define XCToString(x) #x
#define XCToOCString(x,y) x##y


static NSString * const TwoURL = @"app://two";

@interface XCOneController ()

@end

@implementation XCOneController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"One Controller";
    
    NSString *path = XCToOCString("abc","def");
    NSLog(@"%@",path);
    
    
    
    Class Two = NSClassFromString(@"XCTwoController");
    [FCRouter.share regsiterUrl:TwoURL mapViewControllerClass:Two];
    
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)clickedButton:(UIButton *)sender {
    
    UIViewController *two = [FCRouter.share matchViewControllerWithUrl:TwoURL];
    [self.navigationController pushViewController:two animated:YES];
    
    
}



@end
