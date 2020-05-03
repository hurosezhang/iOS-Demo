//
//  YZPerson.h
//  Runtim应用
//
//  Created by jonzhang on 2020/4/26.
//  Copyright © 2020 xinmei. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YZPerson : NSObject
@property (nonatomic, assign) int  age;
@property (nonatomic, strong) NSString *name;
- (void)run;
- (void)test;

@end

NS_ASSUME_NONNULL_END
