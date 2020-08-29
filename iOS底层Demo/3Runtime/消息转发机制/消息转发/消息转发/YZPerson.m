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

- (void) other {
    NSLog(@"%s", __func__);
}

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    
    
    // 动态的添加方法实现
    if (sel == @selector(test)) {
        
        // 获取其他方法 指向method_t的指针
        Method otherMethod = class_getInstanceMethod(self, @selector(other));
          // 动态添加test方法的实现
        class_addMethod(self, sel, method_getImplementation(otherMethod), method_getTypeEncoding(otherMethod));
        // 返回YES表示有动态添加方法

        return YES;
        
    }
    NSLog(@"%s",__func__);
    
    return [super resolveInstanceMethod:sel];
    
}








//- (id)forwardingTargetForSelector:(SEL)aSelector {
//  
//    if (aSelector == @selector(test)) {
//        return nil;
//        
//    }
//    
//    return [super forwardingTargetForSelector:aSelector];
//    
//}
/// 方法签名:返回值类型,参数类型
//- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
//
//    if (aSelector == @selector(test)) {
//
//        return [NSMethodSignature signatureWithObjCTypes:"v16@0:8"];
//    }
//
//    return [super methodSignatureForSelector:aSelector];
//
//}
//NSInvocation 封装了一个方法调用，包括：方法调用者，方法，方法的参数
//    anInvocation.target 方法调用者
//    anInvocation.selector 方法名
//    [anInvocation getArgument: NULL atIndex: 0]; 获得参数

//- (void)forwardInvocation:(NSInvocation *)anInvocation {
//
//    [anInvocation invokeWithTarget:[YZCat new]];
//
//}


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
