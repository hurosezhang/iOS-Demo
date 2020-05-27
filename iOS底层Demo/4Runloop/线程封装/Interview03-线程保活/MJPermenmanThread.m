//
//  MJPermenmanThread.m
//  Interview03-线程保活
//
//  Created by jonzhang on 2020/5/26.
//  Copyright © 2020 MJ Lee. All rights reserved.
//

#import "MJPermenmanThread.h"


@interface MJThread : NSThread

@end

@implementation MJThread

- (void)dealloc
{
    NSLog(@"%s", __func__);
}

@end

@interface MJPermenmanThread ()

@property (nonatomic, strong) MJThread *innerThread;
@property (nonatomic, assign,getter=isStopped) BOOL stopped;
@end
@implementation MJPermenmanThread

- (instancetype)init {
    if (self = [super init]) {
        self.stopped = NO;
        __weak typeof(self) weakSelf = self;
        self.innerThread = [[MJThread alloc] initWithBlock:^{
            [[NSRunLoop currentRunLoop]addPort:[[NSPort alloc]init ] forMode:NSDefaultRunLoopMode ];
        }];
        
        while (weakSelf && !weakSelf.isStopped) {
            [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
        }
    }
    
    return self;
    
}


/// 开启一个线程
- (void)run {
    
    [self.innerThread start];
}


- (void)executeTask:(void(^)(void))task {
    if (!self.innerThread || !task) {// 如果线程不存在就不要再调用
        return;
    }
    [self performSelector:@selector(__executeTask:) onThread:self.innerThread withObject:task waitUntilDone:NO];
    
}

/// 关闭一个线程
- (void)stop {
    if (!self.innerThread) {// 如果线程不存在就不要再调用
        return;
    }
    [self performSelector:@selector(__stop) onThread:self.innerThread withObject:nil waitUntilDone:YES];
    
}
- (void)dealloc
{
    NSLog(@"%s", __func__);
    //当此对象销毁的时候,就让线程停止
    [self stop];
}

- (void)__stop {
    
    self.stopped = YES;
    CFRunLoopStop(CFRunLoopGetCurrent());
    self.innerThread = nil;
    
}
- (void)__executeTask:(void(^)(void))task{
    
    task();
    
}

@end
