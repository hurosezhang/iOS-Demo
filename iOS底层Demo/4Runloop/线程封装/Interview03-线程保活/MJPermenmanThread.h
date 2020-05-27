//
//  MJPermenmanThread.h
//  Interview03-线程保活
//
//  Created by jonzhang on 2020/5/26.
//  Copyright © 2020 MJ Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MJPermenmanThread : NSObject


/// 开启一个线程
- (void)run ;

/// 执行任务
- (void)executeTaskWithTarget:(id)target action:(SEL)action object:(id)object;

- (void)executeTask:(void(^)(void))task;

/// 关闭一个线程
- (void)stop ;

@end

NS_ASSUME_NONNULL_END

