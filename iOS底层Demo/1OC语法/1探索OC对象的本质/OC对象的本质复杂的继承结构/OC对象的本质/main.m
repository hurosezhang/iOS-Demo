//
//  main.m
//  OC对象的本质
//
//  Created by jonzhang on 2020/7/7.
//  Copyright © 2020 xinmei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>


@interface Person : NSObject{
    
    
    int _age;
    
}


@end
@implementation Person



@end


@interface Student : Person{
    
    
    int _no;
    
}


@end
@implementation Student



@end



int main(int argc, const char * argv[]) {
    @autoreleasepool {

        
       
        
        
        //复杂的结构体
        
        
         NSLog(@"%zd  %zd",
                      class_getInstanceSize([Person class]),
                      class_getInstanceSize([Student class])
                      );

        
        
        
        
        


    }
    return 0;
}
