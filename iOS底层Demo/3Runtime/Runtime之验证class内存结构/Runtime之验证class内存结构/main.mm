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
        CollegeStudent *collegeStudent = [[CollegeStudent alloc] init];

        yz_objc_class *collegeStudentClass = (__bridge yz_objc_class *)[CollegeStudent class];

        cache_t cache = collegeStudentClass->cache;
        bucket_t *buckets = cache._buckets;

        [collegeStudent personTest];
        [collegeStudent studentTest];
        NSLog(@"----------------------------");
        for (int i = 0; i <= cache._mask; i++) {
            bucket_t bucket = buckets[i];
            NSLog(@"%s %p", bucket._key, bucket._imp);
        }
        NSLog(@"----------------------------");

        [collegeStudent colleaeStudentTest];

        cache = collegeStudentClass->cache;
        buckets = cache._buckets;
        NSLog(@"----------------------------");
        for (int i = 0; i <= cache._mask; i++) {
            bucket_t bucket = buckets[i];
            NSLog(@"%s %p", bucket._key, bucket._imp);
        }
        NSLog(@"----------------------------");

        NSLog(@"%p", @selector(colleaeStudentTest));
        NSLog(@"----------------------------");
    }
    return 0;
}
