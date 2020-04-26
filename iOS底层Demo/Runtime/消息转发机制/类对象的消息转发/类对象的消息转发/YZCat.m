//
//  YZCat.m
//  类对象的消息转发
//
//  Created by jonzhang on 2020/4/21.
//  Copyright © 2020 xinmei. All rights reserved.
//

#import "YZCat.h"

@implementation YZCat
- (void)test {
    NSLog(@"%s",__func__);

    
}

+ (void)test {
    
    NSLog(@"%s",__func__);
    
}
@end
