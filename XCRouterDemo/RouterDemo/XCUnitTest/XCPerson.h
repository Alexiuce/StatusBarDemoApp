//
//  XCPerson.h
//  XCUnitTest
//
//  Created by Alexcai on 2018/12/4.
//  Copyright © 2018 dongjiu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface XCPerson : NSObject


@property (nonatomic, assign) int  age;
@property (nonatomic, copy) NSString *name;


+ (instancetype)person;

@end

NS_ASSUME_NONNULL_END
