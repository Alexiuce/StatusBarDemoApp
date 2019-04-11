//
//  XCPerson.h
//  XCARMAssembly
//
//  Created by Alexcai on 2018/12/28.
//  Copyright © 2018 dongjiu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface XCPerson : NSObject

@property (nonatomic, assign) long stuNumber;
@property (nonatomic, strong) NSNumber *house;
@property (nonatomic, assign) char starCount;
@property (nonatomic, assign) int age;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) char sex;

+ (void)p_test;

@end

NS_ASSUME_NONNULL_END
