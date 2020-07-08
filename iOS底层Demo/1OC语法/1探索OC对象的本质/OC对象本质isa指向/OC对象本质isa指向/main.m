//
//  main.m
//  OC对象本质isa指向
//
//  Created by jonzhang on 2020/7/7.
//  Copyright © 2020 xinmei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
struct xx_cc_objc_class{
    Class isa;
};
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        

        NSObject *object = [[NSObject alloc] init];
        Class objectClass = [NSObject class];
        
        struct xx_cc_objc_class *objectClass2 = (__bridge struct xx_cc_objc_class *)(objectClass);

        Class objectMetaClass = object_getClass([NSObject class]);
                
        NSLog(@"%p %p %p", object, objectClass, objectMetaClass);











    }
    return 0;
}
