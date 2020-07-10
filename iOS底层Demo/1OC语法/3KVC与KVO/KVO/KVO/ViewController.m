//
//  ViewController.m
//  KVO
//
//  Created by jonzhang on 2020/7/9.
//  Copyright © 2020 xinmei. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import <objc/runtime.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

//    [self kvoshoudong];
    [self kvoAdress];
    
//    [self kvoprintMethods];
    
}

// 手动实现kvo
- (void)kvoshoudong {
    
    Person *p1 = [[Person alloc] init];
    p1.age = 1.0;
       
    NSKeyValueObservingOptions options = NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld;
    [p1 addObserver:self forKeyPath:@"age" options:options context:nil];
        
    [p1 willChangeValueForKey:@"age"];
    [p1 didChangeValueForKey:@"age"];
        
    [p1 removeObserver:self forKeyPath:@"age"];

    
    
    
    
}

// 打印kvo 监听对象的方法
- (void)kvoprintMethods {
    
       Person *p1 = [[Person alloc] init];
        p1.age = 1.0;
        Person *p2 = [[Person alloc] init];
        p1.age = 2.0;
        // self 监听 p1的 age属性
        NSKeyValueObservingOptions options = NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld;
        [p1 addObserver:self forKeyPath:@"age" options:options context:nil];

        [self printMethods: object_getClass(p2)];
        [self printMethods: object_getClass(p1)];

        [p1 removeObserver:self forKeyPath:@"age"];

 
    
}

- (void) printMethods:(Class)cls
{
    unsigned int count ;
    Method *methods = class_copyMethodList(cls, &count);
    NSMutableString *methodNames = [NSMutableString string];
    [methodNames appendFormat:@"%@ - ", cls];
    
    for (int i = 0 ; i < count; i++) {
        Method method = methods[i];
        NSString *methodName  = NSStringFromSelector(method_getName(method));
        
        [methodNames appendString: methodName];
        [methodNames appendString:@" "];
        
    }
    
    NSLog(@"%@",methodNames);
    free(methods);
}


// 打印kvo 对象的内存地址
- (void)kvoAdress {
    
    Person *p1 = [[Person alloc] init];
       Person *p2 = [[Person alloc] init];
       p1.age = 1;
       p1.age = 2;
       p2.age = 2;
    
    
    // 通过methodForSelector找到方法实现的地址
    NSLog(@"添加KVO监听之前 - p1 = %p, p2 = %p", [p1 methodForSelector: @selector(setAge:)],[p2 methodForSelector: @selector(setAge:)]);

    
       // self 监听 p1的 age属性
       NSKeyValueObservingOptions options = NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld;

       [p1 addObserver:self forKeyPath:@"age" options:options context:nil];
       p1.age = 10;
    [p1 setValue:@10 forKey:@"age"];
       NSLog(@"添加KVO监听之后 - p1 = %p, p2 = %p", [p1 methodForSelector: @selector(setAge:)],[p2 methodForSelector: @selector(setAge:)]);

       [p1 removeObserver:self forKeyPath:@"age"];


    
    
}
- (void)kvo {
    

    Person *p1 = [[Person alloc] init];
       Person *p2 = [[Person alloc] init];
       p1.age = 1;
       p1.age = 2;
       p2.age = 2;
       // self 监听 p1的 age属性
       NSKeyValueObservingOptions options = NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld;

       [p1 addObserver:self forKeyPath:@"age" options:options context:nil];
       p1.age = 10;
       [p1 removeObserver:self forKeyPath:@"age"];

}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    NSLog(@"监听到%@的%@改变了%@", object, keyPath,change);
}



@end
