//
//  ViewController.m
//  线程同步方案
//
//  Created by jonzhang on 2020/5/31.
//  Copyright © 2020 xinmei. All rights reserved.
//

#import "ViewController.h"
#import <libkern/OSAtomic.h>
@interface ViewController ()
@property (nonatomic, assign) int ticketsCount;
@property (nonatomic, assign) OSSpinLock lock;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    dispatch_queue_t queue = dispatch_queue_create(0, 0);
    
    NSLog(@"1");
    dispatch_async(queue, ^{
        sleep(0.5);
        NSLog(@"2");
        
        dispatch_sync(dispatch_get_main_queue(), ^{
            NSLog(@"3");
        });
    NSLog(@"4");

    });
    
    
    
    
//    self.lock = OS_SPINLOCK_INIT;
//
//    [self saletricks];
}

- (void)saletrick{
    
    // 加锁
    OSSpinLockLock(&_lock);
    
    int oldtickscount = self.ticketsCount ;
    
    sleep(.8);
    
    oldtickscount--;
    
    self.ticketsCount = oldtickscount;
    
    NSLog(@"还剩票%d----%@",oldtickscount,[NSThread currentThread]);
    
    // 解锁
    OSSpinLockUnlock(&_lock);
    
    
    
}



- (void)saletricks {
    
    self.ticketsCount = 15;
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    dispatch_async(queue, ^{
        for (int i = 0; i < 5; i ++) {
            [self saletrick];
        }
    });
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 5; i ++) {
            [self saletrick];
        }
    });
    dispatch_async(queue, ^{
        for (int i = 0; i < 5; i ++) {
            [self saletrick];
        }
    });

    
    
    
}


@end
