//
//  main.m
//  XCARMAssembly
//
//  Created by Alexcai on 2018/12/3.
//  Copyright © 2018 dongjiu. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        int a = 10;
        int a1 = a++;
        
        /**
          movl   $0xa, -0x14(%rbp)
          movl   -0x14(%rbp), %edi
          movl   %edi, %ecx
          addl   $0x1, %ecx
          movl   %ecx, -0x14(%rbp)
          movl   %edi, -0x18(%rbp)
          movl   -0x18(%rbp), %ecx
         
         */
        
//        int a = 10;
//        int a1 = ++a;
        /**
          movl   $0xa, -0x14(%rbp)
          movl   -0x14(%rbp), %edi
          addl   $0x1, %edi
          movl   %edi, -0x14(%rbp)
          movl   %edi, -0x18(%rbp)
         */
        
//        int b = 20;
//        int c = a + b;
        
        NSLog(@"a + b = %d",a1);
        
        
        /** 至少需要8bit的无符号整型 */
        uint_least8_t lest8 = 0;
        
        /** 快速计算的 int8 类型 */
        int_fast8_t fast8 = 0;
        
//        mov al, 2;
//        add al,al;
//        add al,al;
//        add al,al;
    }
    return 0;
}
