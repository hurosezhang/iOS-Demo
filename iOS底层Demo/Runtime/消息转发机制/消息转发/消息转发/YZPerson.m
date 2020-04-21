//
//  YZPerson.m
//  消息转发
//
//  Created by jonzhang on 2020/4/20.
//  Copyright © 2020 xinmei. All rights reserved.
//

#import "YZPerson.h"
#import <objc/runtime.h>
#import "YZCat.h"
@implementation YZPerson


- (id)forwardingTargetForSelector:(SEL)aSelector {
  
    if (aSelector == @selector(test)) {
        return nil;
        
    }
    
    return [super forwardingTargetForSelector:aSelector];
    
}
/// 方法签名:返回值类型,参数类型
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    
    if (aSelector == @selector(test)) {
        
        return [NSMethodSignature signatureWithObjCTypes:"v16@0:8"];
    }
    
    return [super methodSignatureForSelector:aSelector];
    
}
//NSInvocation 封装了一个方法调用，包括：方法调用者，方法，方法的参数
//    anInvocation.target 方法调用者
//    anInvocation.selector 方法名
//    [anInvocation getArgument: NULL atIndex: 0]; 获得参数

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    
    [anInvocation invokeWithTarget:[YZCat new]];
    
}


//- (id)forwardingTargetForSelector:(SEL)aSelector {
//
//    if (aSelector == @selector(test)) {
//        return [YZCat new];
//    }
//
//    return [super forwardingTargetForSelector:aSelector];
//
//}
@end
