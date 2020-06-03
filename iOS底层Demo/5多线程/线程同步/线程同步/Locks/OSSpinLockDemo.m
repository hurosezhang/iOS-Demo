//
//  OSSpinLockDemo.m
//  线程同步
//
//  Created by jonzhang on 2020/6/2.
//  Copyright © 2020 xinmei. All rights reserved.
//

#import "OSSpinLockDemo.h"
#import <libkern/OSAtomic.h>

@interface OSSpinLockDemo()
// High-level lock
@property (assign, nonatomic) OSSpinLock moneyLock;
@property (assign, nonatomic) OSSpinLock ticketLock;
@end

@implementation OSSpinLockDemo
- (instancetype)init
{
    if (self = [super init]) {
        self.moneyLock = OS_SPINLOCK_INIT;
        self.ticketLock = OS_SPINLOCK_INIT;
    }
    return self;
}

- (void)__drawMoney
{
    OSSpinLockLock(&_moneyLock);
    
    [super __drawMoney];
    
    OSSpinLockUnlock(&_moneyLock);
}

- (void)__saveMoney
{
    OSSpinLockLock(&_moneyLock);
    
    [super __saveMoney];
    
    OSSpinLockUnlock(&_moneyLock);
}

- (void)__saleTicket
{
    OSSpinLockLock(&_ticketLock);
    
    [super __saleTicket];
    
    OSSpinLockUnlock(&_ticketLock);
}

@end
