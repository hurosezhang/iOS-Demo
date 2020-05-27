//
//  main.m
//  isa指针详解
//
//  Created by jonzhang on 2020/4/15.
//  Copyright © 2020 xinmei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import <objc/runtime.h>
int main(int argc, const char * argv[]) {
    @autoreleasepool {

        
//        NSLog(@"%zd",class_getInstanceSize([Person class]));
//        
        Person *per = [[Person alloc] init];
        
        per.tall = YES;
        per.rich = NO;
        per.handsome = YES;
        
        NSLog(@"tall= %d\n rich= %d\n handsome= %d\n  ",per.tall,per.rich,per.handsome);
        
        NSObject * obj = [NSObject new];
        
        
        
    }
    return 0;
}
