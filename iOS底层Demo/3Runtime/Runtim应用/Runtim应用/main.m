//
//  main.m
//  Runtim应用
//
//  Created by jonzhang on 2020/4/26.
//  Copyright © 2020 xinmei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YZPerson.h"
#import "YZCat.h"
#import <objc/runtime.h>
#import <malloc/malloc.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
//// 获取成员变量的信息
//        Ivar ageIvar = class_getInstanceVariable([YZPerson class], "_age");
//        NSLog(@"%s--%s",ivar_getName(ageIvar),ivar_getTypeEncoding(ageIvar));
//
//        // 设置和获取成员变量的值
//        Ivar nameIvar = class_getInstanceVariable([YZPerson class], "_name");
//        YZPerson *person = [[YZPerson alloc] init];
//
//        object_setIvar(person, nameIvar, @"123");
//
//        NSLog(@"----%@",person.name);
//
        
        
        // 成员变量的数量
        unsigned int count ;
        Ivar *ivars  = class_copyIvarList([YZPerson class], &count);
        
        for (int i=0 ; i < count; i++) {
            
            Ivar ivar = ivars[i];
            
            NSLog(@"%s---%s",ivar_getName(ivar),ivar_getTypeEncoding(ivar));
        }
        
        free(ivars);
        
        
        
    }
    return 0;
}

void run(id self ,SEL _cmd)
{
    NSLog(@"%@----%@",self,NSStringFromSelector(_cmd));
    
}


void test(){
    
    
    
    
            // 创建类
            Class newClass  =  objc_allocateClassPair([NSObject class], "YZDog", 0);
            
            class_addIvar(newClass, "_age", 4, 1, @encode(int));
            class_addIvar(newClass, "_weight", 4, 1, @encode(int));
    //        class_addIvar(newClass, "_weight2", 4, 1, @encode(int));

            
            
            class_addMethod(newClass, @selector(run), (IMP)run, "v@:");

            //注册类
            objc_registerClassPair(newClass);
    
    
            
            id dog = [[newClass alloc] init];

            [dog setValue:@10 forKey:@"_age"];
            [dog setValue:@20 forKey:@"_weight"];
            [dog run];
            
            NSLog(@"%zd---%@------%@",class_getInstanceSize(newClass ),[dog valueForKey:@"_age"],[dog valueForKey:@"_weight"]);
            
            
    //        NSLog(@"%zd---",class_getInstanceSize(newClass ));

            
            NSLog(@"%zd",malloc_size((__bridge const void * )dog));
            

    // 在不需要这个类的时候释放
    objc_disposeClassPair(newClass);

    
    
    
    
    
    
    
            YZPerson *person = [YZPerson new];
            
            [person run];

            object_setClass(person, [YZCat class]);
            
            [person run];

            
            
    //        NSLog(@"---%p---%p",object_getClass(person),[person class]);
    //
    //
    //        NSLog(@"---%p---%p",object_getClass([person class]),[person class]);


    
    
}
