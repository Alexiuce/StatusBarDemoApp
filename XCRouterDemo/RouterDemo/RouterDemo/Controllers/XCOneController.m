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

@property (nonatomic, strong) NSDictionary *actionDict;
@property (weak, nonatomic) IBOutlet UILabel *textLabel;
@property (weak, nonatomic) IBOutlet UILabel *testLabel;

@end

@implementation XCOneController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"One Controller";
    __weak typeof(self)  weakSelf = self;
    [FCRouter.share regsiterUrl:@"app://oneHandle" mapHandle:^id(NSDictionary *paramters) {
        NSLog(@"%@",paramters);
        NSLog(@"%@",weakSelf.title);
        self.textLabel.text = paramters[@"name"];
        
        return nil;
    }];
//    NSString *path = XCToOCString("abc","def");
//    NSLog(@"%@",path);
  
    
    
    _actionDict = @{@"a":[self invocationWithSEL:@selector(testA)],
                    @"b":[self invocationWithSEL:@selector(testB)]
                    };
    
    Class Two = NSClassFromString(@"XCTwoController");
    [FCRouter.share regsiterUrl:TwoURL mapViewControllerClass:Two];
    
    
    NSString *test = @"hello world is a programming code";
    CGSize limitSize = (CGSize){100,100};
    CGRect textRect = [test boundingRectWithSize:limitSize options:NSStringDrawingUsesFontLeading | NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]} context:nil];
    
    CGFloat w = ceilf(CGRectGetWidth(textRect));
    CGFloat h = ceilf(CGRectGetHeight(textRect));
    
    NSLog(@"w =%f,h=%f,textRect = %@",w,h,NSStringFromCGRect(textRect));
    self.testLabel.text = test;
    
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)clickedButton:(UIButton *)sender {
    
    NSInvocation *inv = self.actionDict[@"b"];
    [inv invoke];
    UIViewController *two = [FCRouter.share matchViewControllerWithUrl:TwoURL];
    [self.navigationController pushViewController:two animated:YES];
    
}

- (void)testA{
    NSLog(@"%s",__FUNCTION__);
}
- (void)testB{
    NSLog(@"%s",__FUNCTION__);
}


#pragma mark - private method;
- (NSInvocation *)invocationWithSEL:(SEL)methodSel{
    NSMethodSignature *sig = [self methodSignatureForSelector:methodSel];
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:sig];
    invocation.selector = methodSel;
    invocation.target = self;
    return invocation;
}
- (void)dealloc{
     NSLog(@"%s",__FUNCTION__);
}

@end
