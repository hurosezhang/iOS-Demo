//
//  Person.m
//  KVO
//
//  Created by jonzhang on 2020/7/9.
//  Copyright © 2020 xinmei. All rights reserved.
//

#import "Person.h"

@implementation Person
- (void)setAge:(NSInteger)age {
    
    
    NSLog(@"setAge:");
    _age = age;
    

}
- (void)willChangeValueForKey:(NSString *)key {
    
    NSLog(@"willChangeValueForKey: - begin");
    [super willChangeValueForKey:key];
    NSLog(@"willChangeValueForKey: - end");

}
- (void)didChangeValueForKey:(NSString *)key {
    
    NSLog(@"didChangeValueForKey: - begin");
       [super didChangeValueForKey:key];
       NSLog(@"didChangeValueForKey: - end");
    
}
@end
