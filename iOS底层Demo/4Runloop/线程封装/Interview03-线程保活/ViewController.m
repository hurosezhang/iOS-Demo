//
//  ViewController.m
//  Interview03-线程保活
//
//  Created by MJ Lee on 2018/6/3.
//  Copyright © 2018年 MJ Lee. All rights reserved.
//

#import "ViewController.h"
#import "MJThread.h"
#import "MJPermenmanThread.h"
@interface ViewController ()
@property (strong, nonatomic) MJPermenmanThread *thread;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.thread = [[MJPermenmanThread alloc] init];
    
    
    [self.thread run];
    
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{

    [self.thread executeTask:^{
       
        NSLog(@"--执行任务%@",[NSRunLoop currentRunLoop]);
    }];
}

// 子线程需要执行的任务
- (void)test
{
}

- (IBAction)stop {
    
    // 在子线程调用stop
    
    [self.thread stop];
}

// 用于停止子线程的RunLoop
- (void)stopThread
{
    
}

- (void)dealloc
{
    NSLog(@"%s", __func__);
    
//    [self stop];
    
    [self.thread stop];
}

@end
