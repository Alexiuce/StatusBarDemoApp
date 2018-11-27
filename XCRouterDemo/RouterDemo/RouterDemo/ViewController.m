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
#import <StoreKit/StoreKit.h>
#import "XCAppEnterViewController.h"

@interface ViewController ()<PKPaymentAuthorizationViewControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%s",__PRETTY_FUNCTION__);
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"dipatch main code ...");
    });
    
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSLog(@"%s",__FUNCTION__);
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSLog(@"%s",__FUNCTION__);
}
- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    NSLog(@"%s",__FUNCTION__);
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    NSLog(@"%s",__FUNCTION__);
}


- (IBAction)clickPayButton:(UIButton *)sender {
    for (int i = 0; i < 100; i++) {
        NSLog(@"click ......%d",i);        
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"button");
    });
    
}
/** 点击push button */
- (IBAction)clickPushButton:(UIButton *)sender {
    XCAppEnterViewController *controller = [[XCAppEnterViewController alloc]init];
    [self.navigationController pushViewController:controller animated:YES];
    
}



#pragma mark - private method

- (void)p_testRuntimeForFramework{
    unsigned int imageCount = 0;
    const char **images = objc_copyImageNames(&imageCount);
    
    for (int i = 0; i < imageCount; i++) {
        NSLog(@"%s",images[i]);
    }
}
/** apple pay  */
- (void)p_testApplePay{
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
/** iap */
- (void)p_testStoreKit{
    
}

#pragma mark - PKPaymentAuthorizationViewControllerDelegate
- (void)paymentAuthorizationViewControllerDidFinish:(PKPaymentAuthorizationViewController *)controller{
    [controller dismissViewControllerAnimated:YES completion:nil];
}
@end
