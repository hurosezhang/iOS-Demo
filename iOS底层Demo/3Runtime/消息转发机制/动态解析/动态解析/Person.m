//
//  Person.m
//  动态解析
//
//  Created by jonzhang on 2020/4/19.
//  Copyright © 2020 xinmei. All rights reserved.
//

#import "Person.h"
#import <objc/runtime.h>
@implementation Person
//- (void)test {
//
//
//}

- (void)other {
    
    NSLog(@"%s",__func__);

}

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    NSLog(@"%s",__func__);
    
    if (sel == @selector(test)) {
        // 获取其他方法 指向method_t的指针
    
        Method method = class_getInstanceMethod(self, @selector(other));
        
         // 动态添加test方法的实现
        
        class_addMethod(self, sel, method_getImplementation(method), method_getTypeEncoding(method));
        
               // 返回YES表示有动态添加方法
               return YES;
        

    }

  return   [super resolveClassMethod:sel];
    
}

struct method_t {
    SEL sel;
    char *types;
    IMP imp ;
};


//
//+ (BOOL)resolveInstanceMethod:(SEL)sel {
//    NSLog(@"%s",__func__);
//
//    if (sel == @selector(test)) {
//        // 获取其他方法
//        struct method_t *method = (struct method_t *) class_getInstanceMethod(self, @selector(other));
//
//        NSLog(@"%s  %s  %p",method->sel,method ->types ,method -> imp);
//
//        // //        // 动态添加test方法的实现
//
//        class_addMethod(self, sel, method -> imp, method->types);
//
//    }
//
//  return   [super resolveClassMethod:sel];
//
//}
@end
