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


        int age = 10;
        void (^block)(int ,int ) = ^(int a ,int b){
          
            NSLog(@"this is block,a = %d,b = %d",a,b);
            NSLog(@"this is block,age = %d",age);
        };
        

        block(3,5);

    }
    return 0;
}
