//
//  ViewController.m
//  GCD基础
//
//  Created by jonzhang on 2020/5/27.
//  Copyright © 2020 xinmei. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self interView3];
}
- (void)interView3 {
    // 问题：以下代码是在主线程执行的，会不会产生死锁？不会！
    NSLog(@"执行任务1");
    
    dispatch_queue_t queue = dispatch_queue_create("myqueue", DISPATCH_QUEUE_SERIAL);
    // dispatch_async不要求立马在当前线程同步执行任务

    dispatch_async(queue, ^{//blcok0
        NSLog(@"执行任务2");
        dispatch_sync(queue, ^{//blcok1
            NSLog(@"执行任务3");

        });
        NSLog(@"执行任务4");

    });
    
    NSLog(@"执行任务5");
    

}

- (void)interView2 {
    // 问题：以下代码是在主线程执行的，会不会产生死锁？不会！
    NSLog(@"执行任务1");
    
    dispatch_queue_t queue = dispatch_get_main_queue();
    // dispatch_async不要求立马在当前线程同步执行任务

    dispatch_async(queue, ^{
        NSLog(@"执行任务2");
    });
    
    NSLog(@"执行任务3");
    

}

- (void)interView1 {
    // 问题：以下代码是在主线程执行的，会不会产生死锁？不会！
    NSLog(@"执行任务1");
    
    dispatch_queue_t queue = dispatch_get_main_queue();
    // 立即在当前线程执行任务,执行完成才能继续往下执行
    dispatch_sync(queue, ^{
        NSLog(@"执行任务2");
    });
    
    NSLog(@"执行任务3");
    
    // dispatch_async不要求立马在当前线程同步执行任务

}
- (void)mianshi1{
    
   
        dispatch_queue_t queue = dispatch_get_global_queue(0, 0);

        
    //    dispatch_queue_t queue = dispatch_queue_create("myqueue", 0);
        
        
        dispatch_async(queue, ^{
            for (NSInteger i = 0; i < 10; i++) {
                NSLog(@"执行任务1---%@",[NSThread currentThread]);
            }
            
        });
        
        
        dispatch_async(queue, ^{
            for (NSInteger i = 0; i < 10; i++) {
                NSLog(@"执行任务2---%@",[NSThread currentThread]);
            }

            
        });

}


@end
