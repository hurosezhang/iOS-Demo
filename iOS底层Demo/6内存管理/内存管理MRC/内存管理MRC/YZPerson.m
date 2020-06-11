//
//  YZPerson.m
//  内存管理MRC
//
//  Created by jonzhang on 2020/6/7.
//  Copyright © 2020 xinmei. All rights reserved.
//

#import "YZPerson.h"

@implementation YZPerson

- (void)setDog:(YZDog *)dog
{
    if (_dog != dog) {
        [_dog release];
        _dog = [dog retain];
    }
}

- (YZDog *)dog
{
    return _dog;
}

- (void)dealloc
{
    self.dog = nil;
//    self.car = nil;
    NSLog(@"%s", __func__);
    [super dealloc];
}

@end
