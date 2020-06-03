//
//  ViewController.m
//  多线程安全隐患
//
//  Created by jonzhang on 2020/5/31.
//  Copyright © 2020 xinmei. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, assign) int ticketsCount;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self saletricks];
}

- (void)saletrick{
    int oldtickscount = self.ticketsCount ;
    
    sleep(.8);
    
    oldtickscount--;
    
    self.ticketsCount = oldtickscount;
    
    NSLog(@"还剩票%d----%@",oldtickscount,[NSThread currentThread]);
    
    
    
}



- (void)saletricks {
    
    self.ticketsCount = 15;
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    dispatch_async(queue, ^{
        for (int i = 0; i < 5; i ++) {
            [self saletrick];
        }
    });
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 5; i ++) {
            [self saletrick];
        }
    });
    dispatch_async(queue, ^{
        for (int i = 0; i < 5; i ++) {
            [self saletrick];
        }
    });

    
    
    
}

@end
