//
//  ViewController.m
//  runtime方法交换
//
//  Created by jonzhang on 2020/4/28.
//  Copyright © 2020 xinmei. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSString *obj = nil;
    
    
    NSMutableArray * arr = [NSMutableArray array];
    [arr addObject:@"jack"];
    [arr addObject:obj];
    [arr insertObject:obj atIndex:0];
    
    NSLog(@"%@",arr);
    
    
}

- (IBAction)click1:(id)sender {
    
    NSLog(@"%s",__func__);
    
}
- (IBAction)click2:(id)sender {
    
    
    NSLog(@"%s",__func__);

    
}


@end
