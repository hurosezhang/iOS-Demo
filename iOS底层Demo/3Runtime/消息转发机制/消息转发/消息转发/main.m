//
//  main.m
//  消息转发
//
//  Created by jonzhang on 2020/4/20.
//  Copyright © 2020 xinmei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YZPerson.h"
#import "YZPerson3.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        

//        funtion2();
        
        funtion3();
        
    }
    return 0;
}

// 动态解析
int funtion2 (){
    
    YZPerson *person = [[YZPerson alloc] init];
    
    [person test];
    
    return 1;

}
// 消息转发

int funtion3 (){
    
    YZPerson3 *person = [[YZPerson3 alloc] init];
    
    [person test];
    
    return 1;

}

