//
//  main.m
//  TaggedPointer
//
//  Created by jonzhang on 2020/6/6.
//  Copyright © 2020 xinmei. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        
        NSNumber *number1 = @4;
        NSNumber *number2 = @5;
        NSNumber *number3 = @(0xFFFFFFFFFFFFFFF);
        NSLog(@"%p %p %p", number1, number2, number3);

    }
    return 0;
}
