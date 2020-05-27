//
//  ViewController.m
//  复杂面试题
//
//  Created by jonzhang on 2020/4/24.
//  Copyright © 2020 xinmei. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
//    int a = 2;
//    
//    int b = 3;
    
    id cls = [Person class];
    void *obj = &cls ;
    
    [(__bridge id)obj test];
    
    NSLog(@"------------%p",(__bridge id)obj);
    
    Person *person = [[Person alloc] init];
    [person test];
    
    NSLog(@"------------%p",person);

    
    
    
}


@end
