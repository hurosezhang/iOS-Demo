//
//  ViewController.m
//  线程保活
//
//  Created by jonzhang on 2020/5/4.
//  Copyright © 2020 xinmei. All rights reserved.
//

#import "ViewController.h"
#import "YZThread.h"
@interface ViewController ()
@property (nonatomic, strong) YZThread *thread;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
   self.thread = [[YZThread alloc] initWithTarget:self selector:@selector(run) object:nil];
    
    
    [self.thread start];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    
    [self performSelector:@selector(test) onThread:self.thread withObject:nil waitUntilDone:NO];
    
}

- (void)test {
    
    
    NSLog(@"%s---%@",__func__,[NSThread currentThread]);

}

//
- (void)run {

    
    NSLog(@"%s---%@",__func__,[NSThread currentThread]);
    
    // 往runloop里面添加source\timer\observer
    
    [[NSRunLoop currentRunLoop] addPort:[[NSPort alloc]init ] forMode:NSDefaultRunLoopMode];
    
    [[NSRunLoop currentRunLoop] run];
    
    NSLog(@"%s",__func__);
    
    
    
    
}

@end
