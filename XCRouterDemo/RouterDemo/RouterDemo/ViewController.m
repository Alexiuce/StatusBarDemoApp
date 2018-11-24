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
    
    PKPaymentSummaryItem *payItem = [PKPaymentSummaryItem summaryItemWithLabel:@"Hello Pay~" amount:payNumber];
    
    
    
    PKPaymentRequest *payRequest = [[PKPaymentRequest alloc]init];
    payRequest.countryCode = @"CN";
    payRequest.currencyCode = @"CNY";
    payRequest.merchantIdentifier = @"com.day.g";
    
    
    /**
        PKPaymentNetworkAmex
         PKPaymentNetworkCarteBancaire
         PKPaymentNetworkCarteBancaires
         PKPaymentNetworkCartesBancaires
         PKPaymentNetworkChinaUnionPay
         PKPaymentNetworkDiscover
         PKPaymentNetworkEftpos
         PKPaymentNetworkElectron
         PKPaymentNetworkIDCredit
         PKPaymentNetworkInterac
         PKPaymentNetworkJCB
         PKPaymentNetworkMaestro
         PKPaymentNetworkMasterCard
         PKPaymentNetworkPrivateLabel
         PKPaymentNetworkQuicPay
         PKPaymentNetworkSuica
         PKPaymentNetworkVisa
         PKPaymentNetworkVPay
     */
    payRequest.supportedNetworks = @[PKPaymentNetworkInterac];
    /**
     PKMerchantCapability3DS                                  = 1UL << 0,   // Merchant supports 3DS
     PKMerchantCapabilityEMV                                  = 1UL << 1,   // Merchant supports EMV
     PKMerchantCapabilityCredit NS_ENUM_AVAILABLE_IOS(9_0) = 1UL << 2,   // Merchant supports credit
     PKMerchantCapabilityDebit
     */
    payRequest.merchantCapabilities = PKMerchantCapabilityDebit;//PKMerchantCapabilityCredit;
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
