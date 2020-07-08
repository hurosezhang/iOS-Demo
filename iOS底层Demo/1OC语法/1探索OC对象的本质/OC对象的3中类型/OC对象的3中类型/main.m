//
//  main.m
//  OC对象的3中类型
//
//  Created by jonzhang on 2020/7/7.
//  Copyright © 2020 xinmei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSObject *object1 = [[NSObject alloc] init];
        NSObject *object2 = [[NSObject alloc] init];

//        NSLog(@"---%p-----%p",object1,object2);
        
        
        Class objectClass1 = [object1 class];
        Class objectClass2 = [object2 class];
        Class objectClass3 = [NSObject class];

        // runtime
        Class objectClass4 = object_getClass(object1);
        Class objectClass5 = object_getClass(object2);
        NSLog(@"%p %p %p %p %p", objectClass1, objectClass2, objectClass3, objectClass4, objectClass5);

        
    }
    return 0;
}
