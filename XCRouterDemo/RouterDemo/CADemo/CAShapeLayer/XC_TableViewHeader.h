//
//  XC_TableViewHeader.h
//  RouterDemo
//
//  Created by Alexcai on 2019/1/14.
//  Copyright © 2019 dongjiu. All rights reserved.
//

#ifndef XC_TableViewHeader_h
#define XC_TableViewHeader_h

#import <Foundation/Foundation.h>

static  NSString * kShapeViewController = @"CAShapeLayer Demo";
static  NSString * kTextViewController = @"CATextLayer Demo";
static  NSString * kTransformViewController = @"CATransformLayer Demo";


static inline NSString * k_mapViewControllerString(NSString *s){
    NSDictionary <NSString *,NSString *>*temp = @{kShapeViewController:@"XCShapeViewController"
                           
                           };
    
    
    
    return temp[s];
}


//static const NSString * kShapeViewController = @"";
//static const NSString * kShapeViewController = @"";


#endif /* XC_TableViewHeader_h */
