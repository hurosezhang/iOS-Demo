//
//  main.m
//  初探block本质
//
//  Created by jonzhang on 2020/7/13.
//  Copyright © 2020 xinmei. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {


        void(^test)(void) = ^{
                   NSLog(@"Block");
               };
               test();
    }
    return 0;
}
