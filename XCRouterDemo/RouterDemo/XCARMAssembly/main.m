//
//  main.m
//  XCARMAssembly
//
//  Created by Alexcai on 2018/12/3.
//  Copyright © 2018 dongjiu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <stdalign.h>
#import "XCSon.h"


void testUnionFunc(){
    union {
        int8_t a;
        int16_t b;
        int32_t c;
    }u = {.c = 0x04030201};
    printf("0x%.8X, 0x%.8x,0x%.8x\n",u.a,u.b,u.c);
}

static inline int testInlineFunc(int a){
    int c = a + rand();
    return c  + 1;
}


void testBitFieldFunc(){
    struct MYStruce{
        uint8 a : 6;
        uint8 b : 1;
        uint8 c : 8;
    }s = {0x18,0x1,0x2};
    printf("size of == %zu\n",sizeof(s));
    printf("%.16X\n",*(uint32_t *)&s);
    /** 字节对齐单位: 操作符_Alignof() */
    size_t aligon = _Alignof(struct MYStruce);
    printf("aligon == %zu\n",aligon);
    size_t maxAlign = _Alignof(max_align_t);  // 获取支持的最大字节对齐单位;
    printf("sys max align %zu\n",maxAlign);   // 打印16 :  macOS 下最大支持16字节
    
    size_t b_align = alignof(BOOL); // 使用系统的宏定义 alignof()
    printf("bool align size == %zu\n",b_align);
}

void testNSObjectDemo(){
    NSObject *obj = [[NSObject alloc]init];
    NSLog(@"%@",obj);
    
}
void testMutableArrayDemo(int arrayCount){
    
    int arr[4] = {1,3,[2]=10};
    printf("arr address = %p, arr[0] address = %p\n",arr, &arr[0]);
    printf("arr[0] = %d, arr[1] = %d, arr[2] = %d,arr[3] = %d\n",arr[0],arr[1],arr[2],arr[3]);
    
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        XCPerson *p1 = [XCPerson new];
        p1.name = @"alex";
        p1.age = 22;
        XCPerson *p2 = [XCPerson new];
        p2.name = @"jobs";
        p2.age = 33;
        XCPerson *p3 = [XCPerson new];
        p3.name = @"gates";
        p3.age = 20;
        XCPerson *p4 = [XCPerson new];
        p4.name = @"peter";
        p4.age = 21;
        
        NSArray *oldArr = @[p1,p2,p3,p4];
        /** 如果需要动态设置匹配的Key 需要使用占位符 %K 而非%@  */
//        NSPredicate *pred = [NSPredicate predicateWithFormat:@"%K matches %@",@"name",@"alex"];
        NSPredicate *pred = [NSPredicate predicateWithFormat:@"age > 20"];
//        NSArray *resultArr = [oldArr filteredArrayUsingPredicate:pred];
//
//
//        for (XCPerson *r in resultArr) {
//            NSLog(@"name = %@   age = %d" ,r.name,r.age);
//        }
        /** 可变集合 使用filte 会直接修改集合本身s原素 */
        NSMutableArray *m_array = [oldArr mutableCopy];
        [m_array filterUsingPredicate:pred];
        for (XCPerson *r in m_array) {
            NSLog(@"name = %@   age = %d" ,r.name,r.age);
        }
   
    }
    return 0;
}




void testNSInvocation(){
    XCPerson *p = [XCPerson new];
    NSMethodSignature *ms = [p.class methodSignatureForSelector:@selector(p_test)];
    NSInvocation *it = [NSInvocation invocationWithMethodSignature:ms];
    
    XCSon *s = [XCSon new];
    NSMethodSignature *sn = [s.class methodSignatureForSelector:@selector(new)];
    NSInvocation *st = [NSInvocation invocationWithMethodSignature:sn];
    
    NSDictionary <NSString *, NSInvocation *>*dic = @{@"a":it,@"b": st};
    
    [dic[@"a"] invoke];
}

void testPerson(){
    XCPerson *p = [[XCPerson alloc]init];
    p.name = @"alex"; //[NSString stringWithFormat:@"%@",@"alex"];
    p.age = 12;
    p.starCount = 2;
    p.house = @(4);
    p.sex = 'm';
    p.stuNumber = 0x22;
    
    /** 内存数据
     35 26 00 00 01 80 1D 00               BD 24 00 00 01 80 1D 00
     0C 00 00 00 02 00 00 00               B0 20 00 00 01 00 00 00
     22 00 00 00 00 00 00 00               FD 2C 6B 45 D2 6E 12 55
     B0 20 00 00 01 00 00 00               00 00 00 00 00 00 00 00
     F7 2E 10 99 81 E7 44 CC               F0 3F FA 8B FF 7F 00 00
     00 00 00 00 00 00 00 00               00 00 00 00 00 00 00 00
     80 19 AE 2A FF 7F 00 00               00 00 00 00 00 00 00 00
     2D EC B0 58 FF 7F 00 00               00 00 00 00 00 00 00 00
     */
    
    
    XCSon *son = [XCSon new];
    son.girlCount = 0xfeab;
    //        void *tmp = (__bridge void *)p;
    //        printf("p addre == %p \n",tmp);
    //        int *a = (int *)(tmp + 8);
    //        printf("age == %d\n",*a);
    
    NSLog(@"name addr = %p, house addr = %p  son addr = %p ",p.name, p.house,son);
    //        NSLog(@"person name = %@, age is %d",p.name,p.age);
}

void testForConstantDemo(){
    /** c 环境的const 常量问题   */
     const int a = 10;
     int *p = &a;
     *p = 20;
     printf("a = %d\n",a);
    
    
    /** 乘法运算 的汇编指令;
     int a = 100;                 //  movl   $0x64, -0x14(%rbp)
     int b = 10;                  //  movl   $0xa, -0x18(%rbp)
     int c = a * b;               // imull  -0x18(%rbp), %ecx
     printf(" a * b = %d",c);
     */
}
void testForAlignStructDemo(){
    /** 结构体的内存对齐*/
     struct MYStr {
     int64_t d : 5;
     int8_t a : 5 ;
     int32_t b   : 5;
     int16_t c   : 5;
     }s = {0x01,0x02,0x03,0x04};
     printf("%p\n",&s);
     printf("alignof %zu\n",alignof(struct MYStr));
     printf("size is %zu \n",sizeof(s));
     printf("a = %d, b = %d, c = %d , d = %d\n",s.a,s.b,s.c,s.d);
    /**
     01 62 10 00 00 00 00 00
     0000 0001 0110 0010 0001 0000 ....
     0000 0001
     0000 0010
     0000 0011
     0000 0100
     */
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
