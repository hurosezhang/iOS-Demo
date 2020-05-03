//
//  main.m
//  llVM中间代码
//
//  Created by jonzhang on 2020/4/26.
//  Copyright © 2020 xinmei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YZPerson.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {

        YZPerson * person = [[YZPerson alloc] init];
        
        [person run];

    }
    return 0;
}
