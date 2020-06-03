//
//  OSSpinLockDemo2.m
//  线程同步
//
//  Created by jonzhang on 2020/6/2.
//  Copyright © 2020 xinmei. All rights reserved.
//

#import "OSSpinLockDemo2.h"
#import <libkern/OSAtomic.h>

static OSSpinLock moneyLock_ ;
@implementation OSSpinLockDemo2

+ (void)initialize {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        moneyLock_ = 0;
    });
}

- (void)__drawMoney
{
    OSSpinLockLock(&moneyLock_);
    
    [super __drawMoney];
    
    OSSpinLockUnlock(&moneyLock_);
}

- (void)__saveMoney
{
    OSSpinLockLock(&moneyLock_);
    
    [super __saveMoney];
    
    OSSpinLockUnlock(&moneyLock_);
}

- (void)__saleTicket
{
//    static NSString *str = nil;
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        str = [NSString stringWithFormat:@"123"];
//    });
    
    static OSSpinLock ticketLock = OS_SPINLOCK_INIT;
    
    OSSpinLockLock(&ticketLock);
    
    [super __saleTicket];
    
    OSSpinLockUnlock(&ticketLock);
}


@end
