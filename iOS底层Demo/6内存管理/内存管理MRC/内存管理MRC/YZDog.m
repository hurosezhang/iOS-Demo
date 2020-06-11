//
//  YZDog.m
//  内存管理MRC
//
//  Created by jonzhang on 2020/6/7.
//  Copyright © 2020 xinmei. All rights reserved.
//

#import "YZDog.h"

@implementation YZDog
- (void)run
{
    NSLog(@"%s", __func__);
}

- (void)dealloc
{
    [super dealloc];
    
    NSLog(@"%s", __func__);
}


@end
