//
//  main.m
//  block访问对象类型
//
//  Created by jonzhang on 2020/7/15.
//  Copyright © 2020 xinmei. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSObject * obj1 = [[NSObject alloc] init];
        void(^test1)(void) = ^{
            NSLog(@"NSMallocBlock - %@", obj1);

        };
        
        test1();
        
        
        
        NSObject * obj2 = [[NSObject alloc] init];

        __weak typeof (obj2) weakobj = obj2;
        
        void (^test2)(void) = ^{
            NSLog(@"NSMallocBlock - %@", weakobj);

        };
        
        test2();





    }
    return 0;
}
