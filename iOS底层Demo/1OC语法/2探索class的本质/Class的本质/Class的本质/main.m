//
//  main.m
//  Class的本质
//
//  Created by jonzhang on 2020/7/8.
//  Copyright © 2020 xinmei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import "XXClassInfo.h"

/* Person */
@interface Person : NSObject <NSCopying>
{
    @public
    int _age;
}
@property (nonatomic, assign) int height;
- (void)personMethod;
+ (void)personClassMethod;
@end

@implementation Person
- (void)personMethod {}
+ (void)personClassMethod {}
@end

/* Student */
@interface Student : Person <NSCoding>
{
    @public
    int _no;
}

@property (nonatomic, assign) int score;
- (void)studentMethod;
+ (void)studentClassMethod;
@end

@implementation Student
- (void)studentMethod {}
+ (void)studentClassMethod {}
@end




int main(int argc, const char * argv[]) {
    @autoreleasepool {

//        Class objectClass = [NSObject class];
//
//        Class objectMetaClass = object_getClass([NSObject class]);

        
                // 实例对象
                NSObject *object = [[NSObject alloc] init];
                Person *person = [[Person alloc] init];
                Student *student = [[Student alloc] init];
                
                // 类对象
                xx_objc_class *objectClass = (__bridge xx_objc_class *)[object class];
                xx_objc_class *personClass = (__bridge xx_objc_class *)[person class];
                xx_objc_class *studentClass = (__bridge xx_objc_class *)[student class];
                
                // 元类对象
                xx_objc_class *objectMetaClass = objectClass->metaClass();
                xx_objc_class *personMetaClass = personClass->metaClass();
                xx_objc_class *studentMetaClass = studentClass->metaClass();
                
               // 类方法中的class_rw_t
                class_rw_t *objectClassData = objectClass->data();
                class_rw_t *personClassData = personClass->data();
                class_rw_t *studentClassData = studentClass->data();
        
        
                // 元类方法中的class_rw_t

                class_rw_t *objectMetaClassData = objectMetaClass->data();
                class_rw_t *personMetaClassData = personMetaClass->data();
                class_rw_t *studentMetaClassData = studentMetaClass->data();

                // 0x00007ffffffffff8
                NSLog(@"%p %p %p %p %p %p",  objectClassData, personClassData, studentClassData,
                      objectMetaClassData, personMetaClassData, studentMetaClassData);


        
        
        
        

    }
    return 0;
}
