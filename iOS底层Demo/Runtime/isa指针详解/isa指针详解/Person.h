//
//  Person.h
//  isa指针详解
//
//  Created by jonzhang on 2020/4/15.
//  Copyright © 2020 xinmei. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

//@property (nonatomic, assign, getter = isTall) BOOL tall;
//@property (nonatomic, assign, getter = isRich) BOOL rich;
//@property (nonatomic, assign, getter = isHansome) BOOL handsome;



- (BOOL)tall;

- (BOOL)rich;

- (BOOL)handsome;

- (void)setTall:(BOOL)tall;
- (void)setRich:(BOOL)rich;

- (void)setHandsome:(BOOL)handsome;

@end

NS_ASSUME_NONNULL_END
