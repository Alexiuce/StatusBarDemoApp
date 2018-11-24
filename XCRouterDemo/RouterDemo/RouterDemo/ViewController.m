//
//  ViewController.m
//  RouterDemo
//
//  Created by Alexcai on 2018/11/23.
//  Copyright © 2018 dongjiu. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
#import <PassKit/PassKit.h>

@interface ViewController ()<PKPaymentAuthorizationViewControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}



- (IBAction)clickPayButton:(UIButton *)sender {
    
    NSDecimalNumber *payNumber = [[NSDecimalNumber alloc]initWithString:@"20.5"];
    
    PKPaymentSummaryItem *payItem = [PKPaymentSummaryItem summaryItemWithLabel:@"H" amount:payNumber];
    
    PKPaymentRequest *payRequest = [[PKPaymentRequest alloc]init];
    payRequest.countryCode = @"CN";
    payRequest.currencyCode = @"CNY";
    payRequest.merchantIdentifier = @"com.day.pay";
    payRequest.supportedNetworks = @[PKPaymentNetworkDiscover];
    payRequest.merchantCapabilities = PKMerchantCapabilityCredit;
    payRequest.paymentSummaryItems = @[payItem];
    PKPaymentAuthorizationViewController * controller = [[PKPaymentAuthorizationViewController alloc]initWithPaymentRequest:payRequest];
    controller.delegate = self;
    [self presentViewController:controller animated:YES completion:nil];
    
}
#pragma mark - private method

- (void)p_testRuntimeForFramework{
    unsigned int imageCount = 0;
    const char **images = objc_copyImageNames(&imageCount);
    
    for (int i = 0; i < imageCount; i++) {
        NSLog(@"%s",images[i]);
    }
}


#pragma mark
- (void)paymentAuthorizationViewControllerDidFinish:(PKPaymentAuthorizationViewController *)controller{
    [controller dismissViewControllerAnimated:YES completion:nil];
}
@end
