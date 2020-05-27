//
//  UIControl+Extension.m
//  runtime方法交换
//
//  Created by jonzhang on 2020/4/28.
//  Copyright © 2020 xinmei. All rights reserved.
//

#import "UIControl+Extension.h"

#import <objc/runtime.h>

@implementation UIControl (Extension)
+ (void)load {
    Method method1 = class_getInstanceMethod([self class], @selector(sendAction:to:forEvent:));

    Method method2 = class_getInstanceMethod([self class], @selector(yz_sendAction:to:forEvent:));

    method_exchangeImplementations(method1, method2);
}

- (void)yz_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    
    // 会造成死循环,因为内部的实现方法已经交换
//    [self sendAction:action to:target forEvent:event];

    // 不会造成死循环
    [self yz_sendAction:action to:target forEvent:event];

    NSLog(@"123");
}

@end
