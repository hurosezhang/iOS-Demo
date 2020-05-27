//
//  main.m
//  MemberKindOfClass
//
//  Created by jonzhang on 2020/4/22.
//  Copyright © 2020 xinmei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YZPerson.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {

        
        NSLog(@"%d", [[NSObject class] isKindOfClass:[NSObject class]]);
        NSLog(@"%d", [[NSObject class] isMemberOfClass:[NSObject class]]);
        NSLog(@"%d", [[YZPerson class] isKindOfClass:[YZPerson class]]);
        NSLog(@"%d", [[YZPerson class] isMemberOfClass:[YZPerson class]]);
                





    }
    return 0;
}
