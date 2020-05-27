//
//  main.m
//  runtime方法相关的api
//
//  Created by jonzhang on 2020/4/28.
//  Copyright © 2020 xinmei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YZPerson.h"
#import "YZCat.h"
#import <objc/runtime.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {

//        Method runMethod = class_getInstanceMethod([YZPerson class], @selector(run));
//
//        Method testMethod = class_getInstanceMethod([YZPerson class], @selector(test));
        

        
        Method runMethod = class_getInstanceMethod([YZPerson class], @selector(run));
        
        Method runCat = class_getInstanceMethod([YZCat class], @selector(run));

        
        method_exchangeImplementations(runMethod, runCat);
        
        YZPerson *person = [[YZPerson alloc] init];
        
        [person run];


    }
    return 0;
}



void myrun (){
    
    NSLog(@"---myrun");
    
}

void test (){
    
    
            YZPerson *person = [[YZPerson alloc] init];
            
            
    //        class_replaceMethod([YZPerson class], @selector(run), (IMP)myrun , "v");
            
            class_replaceMethod([YZPerson class], @selector(run), imp_implementationWithBlock(^{
                
                NSLog(@"123");
            }) , "v");

            [person run];

    
    
}

