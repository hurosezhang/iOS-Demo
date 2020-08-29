//
//  main.m
//  初探block本质
//
//  Created by jonzhang on 2020/7/13.
//  Copyright © 2020 xinmei. All rights reserved.
//

#import <Foundation/Foundation.h>
//定义全局变量c
int c = 30;
int main(int argc, const char * argv[]) {
    @autoreleasepool {


         //局部变量a
                int a = 10;
                //静态变量b
                static int b = 20;
                void(^test)(void) = ^{
                    NSLog(@"Block - %d, %d, %d", a, b, c);
                };
                test();

    
        
        
    }
    return 0;
}
