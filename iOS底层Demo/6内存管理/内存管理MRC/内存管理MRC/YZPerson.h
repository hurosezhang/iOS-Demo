//
//  YZPerson.h
//  内存管理MRC
//
//  Created by jonzhang on 2020/6/7.
//  Copyright © 2020 xinmei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YZDog.h"
NS_ASSUME_NONNULL_BEGIN

@interface YZPerson : NSObject
{
    YZDog *_dog;
//    MJCar *_car;
//    int _age;
}
//
//- (void)setAge:(int)age;
//- (int)age;
//
- (void)setDog:(YZDog *)dog;
- (YZDog *)dog;
//
//- (void)setCar:(MJCar *)car;
//- (MJCar *)car;
@end

NS_ASSUME_NONNULL_END
