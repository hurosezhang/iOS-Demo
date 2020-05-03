//
//  YZPerson.m
//  llVM中间代码
//
//  Created by jonzhang on 2020/4/26.
//  Copyright © 2020 xinmei. All rights reserved.
//

#import "YZPerson.h"

@implementation YZPerson

void test (int param )
{
    
    
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
         return [NSMethodSignature signatureWithObjCTypes:"v@:"];;
}
- (void)forwardInvocation:(NSInvocation *)anInvocation {
    
    [super forwardInvocation:anInvocation];
    
    
//    objc_msgSendSuper)(self, (id)class_getSuperclass(objc_getClass("YZPerson"))}
//                       , sel_registerName("forwardInvocation:")
//                       , (NSInvocation *)anInvocation);

    
    
    int a = 10;
    int b = 20;
    
    int c = a + b;
    test(c);
    
    
}
@end
