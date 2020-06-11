//
//  main.m
//  内部布局
//
//  Created by jonzhang on 2020/6/6.
//  Copyright © 2020 xinmei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
int a = 10;
int b;

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        
        static int c = 20;
        
        static int d;
        
        int e;
        int f = 20;

        NSString *str = @"123";
        
        NSObject *obj = [[NSObject alloc] init];
        
        NSLog(@"\n&a=%p\n&b=%p\n&c=%p\n&d=%p\n&e=%p\n&f=%p\nstr=%p\nobj=%p\n",
              &a, &b, &c, &d, &e, &f, str, obj);

        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
