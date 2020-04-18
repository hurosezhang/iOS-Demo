//
//  Person.m
//  isa指针详解
//
//  Created by jonzhang on 2020/4/15.
//  Copyright © 2020 xinmei. All rights reserved.
//

#import "Person.h"



#define TallMask (1<<2) //0b00000100 // 4
#define RichMask  (1<<1) //0b00000010 // 2
#define HandsomeMask (1<<0) //0b00000001 //1
@interface Person ()
{
    
    union {
        char bits;
        struct {
            char handsome : 1; // 位域，代表占用一位空间
            char rich : 1;  // 按照顺序只占一位空间
            char tall : 1;
        } ;
    }_tallRichHandsome;

}

@end

@implementation Person

- (BOOL)tall
{

    return !!(_tallRichHandsome.tall & TallMask);

}

- (BOOL)rich
{
    return !!(_tallRichHandsome.rich & RichMask);


}

- (BOOL)handsome
{
    return !!(_tallRichHandsome.handsome & HandsomeMask);
}

- (void)setTall:(BOOL)tall
{


    if (tall) { // 如果此值为yes,按位|

        _tallRichHandsome.tall |= TallMask;

    }else{

        _tallRichHandsome.tall &= ~TallMask;
    }


}
- (void)setRich:(BOOL)rich
{
    if (rich) {
        _tallRichHandsome.rich |= RichMask;
    }else{
        _tallRichHandsome.rich &= ~RichMask;
    }
}

- (void)setHandsome:(BOOL)handsome
{

    if (handsome) {
        _tallRichHandsome.handsome |= HandsomeMask;
    }else{
        _tallRichHandsome.handsome &= ~HandsomeMask;
    }

}




#pragma mark - 用结构体,不用共用体
//- (BOOL)tall
//{
//
//    return _tallRichHandsome.tall;
//
//}
//
//- (BOOL)rich
//{
//    return _tallRichHandsome.rich;
//
//
//}
//
//- (BOOL)handsome
//{
//    BOOL ret = _tallRichHandsome.handsome;
//    return ret;
//}
//
//- (void)setTall:(BOOL)tall
//{
//
//
//    _tallRichHandsome.tall = tall;
//
//}
//- (void)setRich:(BOOL)rich
//{
//    _tallRichHandsome.rich = rich;
//}
//
//- (void)setHandsome:(BOOL)handsome
//{
//
//    _tallRichHandsome.handsome = handsome;
//
//}
//



#pragma mark - 不用位域
//- (BOOL)tall
//{
//
//    return !!(_tallRichHandsome & TallMask);
//
//}
//
//- (BOOL)rich
//{
//    return !!(_tallRichHandsome & RichMask);
//
//
//}
//
//- (BOOL)handsome
//{
//    return !!(_tallRichHandsome & HandsomeMask);
//}
//
//- (void)setTall:(BOOL)tall
//{
//
//
//    if (tall) { // 如果此值为yes,按位|
//
//        _tallRichHandsome |= TallMask;
//
//    }else{
//
//        _tallRichHandsome &= ~TallMask;
//    }
//
//
//}
//- (void)setRich:(BOOL)rich
//{
//    if (rich) {
//        _tallRichHandsome |= RichMask;
//    }else{
//        _tallRichHandsome &= ~RichMask;
//    }
//}
//
//- (void)setHandsome:(BOOL)handsome
//{
//
//    if (handsome) {
//        _tallRichHandsome |= HandsomeMask;
//    }else{
//        _tallRichHandsome &= ~HandsomeMask;
//    }
//
//}
//

@end
