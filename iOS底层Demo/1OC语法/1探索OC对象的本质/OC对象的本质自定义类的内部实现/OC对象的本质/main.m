//
//  main.m
//  OC对象的本质
//
//  Created by jonzhang on 2020/7/7.
//  Copyright © 2020 xinmei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
struct Student_IMPL {
    
    Class isa ;
    
    int _no;
    int _age;
    
};


@interface Student : NSObject{
    
    
  @public
    int _no;
    int _age;
    
}


@end
@implementation Student



@end



int main(int argc, const char * argv[]) {
    @autoreleasepool {

        
       
        Student *stu = [[Student alloc] init];
        
        stu->_no = 23;
        stu->_age = 24;
        
        NSLog(@"---%@",stu);
        
        
        // 强行转化成 结构体
        struct Student_IMPL * stuImpl = (__bridge struct Student_IMPL *)(stu) ;
        
        NSLog(@"_no = %d     _age = %d",stuImpl -> _no,stuImpl -> _age);
        
        
        
        NSLog(@"%zd-----%zd",class_getInstanceSize([NSObject class]),class_getInstanceSize([Student class]));
        
        
        //复杂的结构体
        
        
        
        
        
        
        
        


    }
    return 0;
}
