//
//  main.m
//  XCARMAssembly
//
//  Created by Alexcai on 2018/12/3.
//  Copyright © 2018 dongjiu. All rights reserved.
//

#import <Foundation/Foundation.h>

void testUnionFunc(){
    union {
        int8_t a;
        int16_t b;
        int32_t c;
    }u = {.c = 0x04030201};
    printf("0x%.8X, 0x%.8x,0x%.8x\n",u.a,u.b,u.c);
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        testUnionFunc();
    }
    return 0;
}


void test1(){
    
    
    
    
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
    
    /** 声明一个无符号8bit长度的int类型 */
    uint8 u8 = 12;
    /** 定义一个可以存放指针的变量*/
    uintptr_t p8 =(uintptr_t) &u8;
    /** 至少需要8bit的无符号整型 */
    uint_least8_t lest8 = 5;
    
    /** 快速计算的 int8 类型 */
    int_fast8_t fast8 = 6;
    /** 以16进制方式输出 %x(小写) %X(大写) int值*/
    printf("0x%.14zX",p8);
    
    //        mov al, 2;
    //        add al,al;
    //        add al,al;
    //        add al,al;
}
