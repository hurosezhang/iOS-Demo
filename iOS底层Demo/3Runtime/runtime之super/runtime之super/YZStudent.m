//
//  YZStudent.m
//  runtime之super
//
//  Created by jonzhang on 2020/4/21.
//  Copyright © 2020 xinmei. All rights reserved.
//

#import "YZStudent.h"

@implementation YZStudent

- (void)run
{
    // super调用的receiver仍然是MJStudent对象
    [super run];

}
//- (instancetype)init
//{
//    if (self = [super init]) {
//        NSLog(@"[self class] = %@", [self class]); // MJStudent
//        NSLog(@"[self superclass] = %@", [self superclass]); // MJPerson
//
//        NSLog(@"--------------------------------");
//
//        // objc_msgSendSuper({self, [MJPerson class]}, @selector(class));
//        NSLog(@"[super class] = %@", [super class]); // MJStudent
//        NSLog(@"[super superclass] = %@", [super superclass]); // MJPerson
//    }
//    return self;
//}


@end
