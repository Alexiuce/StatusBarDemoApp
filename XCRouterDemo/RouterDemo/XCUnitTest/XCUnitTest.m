//
//  XCUnitTest.m
//  XCUnitTest
//
//  Created by Alexcai on 2018/12/4.
//  Copyright © 2018 dongjiu. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "XCPerson.h"

@interface XCUnitTest : XCTestCase

@property (nonatomic, strong) NSArray *persons;

@end

@implementation XCUnitTest

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    XCPerson *p1 = [XCPerson person];
    XCPerson *p2 = [XCPerson person];
    XCPerson *p3 = [XCPerson person];
    XCPerson *p4 = [XCPerson person];
    XCPerson *p5 = [XCPerson person];
    XCPerson *p6 = [XCPerson person];
    XCPerson *p7 = [XCPerson person];
    XCPerson *p8 = [XCPerson person];
    XCPerson *p9 = [XCPerson person];
    XCPerson *p10 = [XCPerson person];
    
    self.persons = @[p1,p2,p3,p4,p5,p6,p7,p8,p9,p10];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    NSMutableArray *temp = [NSMutableArray array];
    [self measureBlock:^{
//        for (int i = 0; i < 10; i++) {
//            [temp addObject:((XCPerson *)self.persons[i]).name];
//        }
        
//        NSArray *t = [self.persons valueForKeyPath:@"name"];
//        [temp addObjectsFromArray:t];
        
//        for (XCPerson *p in self.persons) {
//            [temp addObject:p.name];
//        }
        
        [self.persons enumerateObjectsUsingBlock:^(XCPerson *obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [temp addObject:obj.name];
        }];
    }];
    
//    [temp enumerateObjectsUsingBlock:^(NSString * obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        NSLog(@"%zd %@ ",idx,obj);
//    }];
}

@end
