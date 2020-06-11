//
//  main.m
//  内存管理MRC
//
//  Created by jonzhang on 2020/6/7.
//  Copyright © 2020 xinmei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YZPerson.h"
#import "YZDog.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        YZDog * dog= [[YZDog alloc] init];
        YZPerson *person = [[YZPerson alloc] init];
        
        
        [person release];
        
    }
    return 0;
}
