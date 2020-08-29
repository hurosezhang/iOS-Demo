//
//  main.m
//  __block的用法
//
//  Created by jonzhang on 2020/7/15.
//  Copyright © 2020 xinmei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YZPerson.h"



typedef void(^TestBlock)(void);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
       
        __block YZPerson *person = [[YZPerson alloc] init];
        __block int a = 10;
            TestBlock block = ^{
                    person = nil;
                    a = 20;
                    NSLog(@"block -- a:%d, person:%@",a,person);
                };
                block();
                NSLog(@"block调用后，a:%d, person:%@",a,person);

    
        
        
        
        
    }
    return 0;
}
