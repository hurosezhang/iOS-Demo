//
//  main.m
//  block类型
//
//  Created by jonzhang on 2020/7/14.
//  Copyright © 2020 xinmei. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        

        //第一种类型NSGlobalBlock
        NSLog(@"%@",[^{
            NSLog(@"NSGlobalBlock");
        } class]);

        //第二种类型NSStackBlock
        int a = 10;
        NSLog(@"%@",[^{
            NSLog(@"---%d",a);
        } class]);


        
          //第三种类型NSMallocBlock - 1
                void(^test2)(void) = ^{
                    NSLog(@"NSMallocBlock - %d", a);
                };
                NSLog(@"%@",[test2 class]);
                
                //第三种类型NSMallocBlock - 2
                NSLog(@"%@",[[^{
                    NSLog(@"%d", a);
                } copy] class]);



    }
    return 0;
}
