//
//  YZPerson.m
//  类对象的消息转发
//
//  Created by jonzhang on 2020/4/21.
//  Copyright © 2020 xinmei. All rights reserved.
//

#import "YZPerson.h"
#import "YZCat.h"
@implementation YZPerson


+ (id)forwardingTargetForSelector:(SEL)aSelector {
    
    if (aSelector == @selector(test) ) {
       
    
//        return [YZCat class];
        
        return nil;
        
    }
    
    return [super forwardingTargetForSelector:aSelector];
}

+ (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
      if (aSelector == @selector(test) ) {
           
        
          return [NSMethodSignature signatureWithObjCTypes: "v@:"];

      
      }
    
  return   [super methodSignatureForSelector:aSelector];
    
}
+ (void)forwardInvocation:(NSInvocation *)anInvocation {
    
    [anInvocation invokeWithTarget:[YZCat class]];
}
@end
