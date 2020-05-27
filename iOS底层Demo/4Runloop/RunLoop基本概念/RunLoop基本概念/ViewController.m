//
//  ViewController.m
//  RunLoop基本概念
//
//  Created by jonzhang on 2020/5/3.
//  Copyright © 2020 xinmei. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"%p---%p",[NSRunLoop currentRunLoop],[NSRunLoop mainRunLoop]);
    
    NSLog(@"%p---%p",CFRunLoopGetCurrent(),CFRunLoopGetMain());

}


@end
