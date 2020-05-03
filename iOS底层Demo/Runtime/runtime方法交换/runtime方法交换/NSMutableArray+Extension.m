//
//  NSMutableArray+Extension.m
//  runtime方法交换
//
//  Created by jonzhang on 2020/5/3.
//  Copyright © 2020 xinmei. All rights reserved.
//

#import "NSMutableArray+Extension.h"

#import <objc/runtime.h>


@implementation NSMutableArray (Extension)
+ (void)load {
    Class cls = NSClassFromString(@"__NSArrayM");
    Method method1 = class_getInstanceMethod(cls, @selector(insertObject:atIndex:));

    Method method2 = class_getInstanceMethod(cls, @selector(yz_insertObject:atIndex:));

    method_exchangeImplementations(method1, method2);
}

- (void)yz_insertObject:(id)anObject atIndex:(NSUInteger)index {
    
    if (anObject == nil) {
        return;
    }
    [self yz_insertObject:anObject atIndex:index];
//    NSLog(@"------");
    
}

@end
