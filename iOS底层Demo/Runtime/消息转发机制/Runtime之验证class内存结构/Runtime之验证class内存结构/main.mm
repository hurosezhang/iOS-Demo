//
//  main.m
//  Runtime之验证class内存结构
//
//  Created by jonzhang on 2020/4/18.
//  Copyright © 2020 xinmei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import "YZClassInfo.h"
#import "CollegeStudent.h"
#import "Person.h"
#import "Student.h"

int main(int argc, const char *argv[])
{
    @autoreleasepool {
     
        Person *person = [[Person alloc] init];
        
        [person personTest];
        
        Person *person = ((Person *(*)(id, SEL))(void *)objc_msgSend)((id)((Person *(*)(id, SEL))(void *)objc_msgSend)((id)objc_getClass("Person"), sel_registerName("alloc")), sel_registerName("init"));

        ((void (*)(id, SEL))(void *)objc_msgSend)((id)person, sel_registerName("personTest"));

        
        
    }
    return 0;
}

