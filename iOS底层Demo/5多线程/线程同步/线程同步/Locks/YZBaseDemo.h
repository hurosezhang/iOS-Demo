//
//  YZBaseDemo.h
//  线程同步
//
//  Created by jonzhang on 2020/6/2.
//  Copyright © 2020 xinmei. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YZBaseDemo : NSObject

- (void)moneyTest;
- (void)ticketTest;
- (void)otherTest;

#pragma mark - 暴露给子类去使用
- (void)__saveMoney;
- (void)__drawMoney;
- (void)__saleTicket;

@end

NS_ASSUME_NONNULL_END
