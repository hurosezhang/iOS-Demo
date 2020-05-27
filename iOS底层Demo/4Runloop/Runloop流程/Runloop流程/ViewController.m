//
//  ViewController.m
//  Runloop流程
//
//  Created by jonzhang on 2020/5/4.
//  Copyright © 2020 xinmei. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    [NSTimer scheduledTimerWithTimeInterval:1.0 repeats:NO block:^(NSTimer * _Nonnull timer) {
//
//        NSLog(@"123");
//
//
//
//    }];
    
    
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
       // 处理一些子线程的逻辑
        
        
        
        // 回到主线程刷新UI界面
        
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"123456");
        });
        
    });
    
    
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    
    
    
}

@end
