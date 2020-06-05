//
//  ViewController.m
//  读写安全
//
//  Created by jonzhang on 2020/6/5.
//  Copyright © 2020 xinmei. All rights reserved.
//

#import "ViewController.h"
#import <pthread.h>
@interface ViewController ()
@property (nonatomic, strong) dispatch_queue_t queue;

@property (nonatomic, assign) pthread_rwlock_t lock;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    [self barrier];
    
    // 初始化锁
    pthread_rwlock_init(&_lock, NULL);
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    for (int i = 0; i < 10; i++) {
        dispatch_async(queue, ^{
            [self read];
        });
        dispatch_async(queue, ^{
            [self write];
        });
    }

    
    
}

- (void)read {
    pthread_rwlock_rdlock(&_lock);
    
    sleep(1);
    NSLog(@"%s", __func__);
    
    pthread_rwlock_unlock(&_lock);
}

- (void)write
{
    pthread_rwlock_wrlock(&_lock);
    
    sleep(1);
    NSLog(@"%s", __func__);
    
    pthread_rwlock_unlock(&_lock);
}

- (void)dealloc
{
    pthread_rwlock_destroy(&_lock);
}









//
//
//- (void)barrier{
//
//
//    self.queue = dispatch_queue_create("rw_queue", DISPATCH_QUEUE_CONCURRENT);
//
//    for (int i = 0; i < 10; i++) {
//        dispatch_async(self.queue, ^{
//            [self read];
//        });
//
//        dispatch_async(self.queue, ^{
//            [self read];
//        });
//
//        dispatch_async(self.queue, ^{
//            [self read];
//        });
//
//        dispatch_barrier_async(self.queue, ^{
//            [self write];
//        });
//    }
//
//
//
//}
//
//
//- (void)read {
//    sleep(1);
//    NSLog(@"read");
//}
//
//- (void)write
//{
//    sleep(1);
//    NSLog(@"write");
//}



@end
