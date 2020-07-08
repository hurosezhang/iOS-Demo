//
//  main.m
//  Class的本质
//
//  Created by jonzhang on 2020/7/8.
//  Copyright © 2020 xinmei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
int main(int argc, const char * argv[]) {
    @autoreleasepool {

        Class objectClass = [NSObject class];
        
        Class objectMetaClass = object_getClass([NSObject class]);


    }
    return 0;
}
