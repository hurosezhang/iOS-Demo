//
//  YZPerson3.m
//  消息转发
//
//  Created by jonzhang on 2020/7/20.
//  Copyright © 2020 xinmei. All rights reserved.
//

#import "YZPerson3.h"
#import <objc/runtime.h>
#import "YZCat.h"

@implementation YZPerson3

//- (id)forwardingTargetForSelector:(SEL)aSelector {
//
//    // 返回能够处理消息的对象
//
//    if (aSelector == @selector(test)) {
//
//        return [YZCat new];
//
//    }
//    return [super forwardingTargetForSelector:aSelector];
//
//
//}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    
    // 返回能够处理消息的对象

    if (aSelector == @selector(test)) {
        
        return nil;
//        return [YZCat new];
        
    }
    return [super forwardingTargetForSelector:aSelector];
    
    
}

// 方法签名：返回值类型、参数类型

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    if (aSelector == @selector(test)) {

        return [[YZCat new] methodSignatureForSelector:aSelector];
    }
    
    return [super methodSignatureForSelector:aSelector];
    
}
- (void)forwardInvocation:(NSInvocation *)anInvocation {
    
    [anInvocation invokeWithTarget:[YZCat new]];
}

@end
