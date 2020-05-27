//
//  ViewController.m
//  Runtime应用查找textFlight成员
//
//  Created by jonzhang on 2020/4/27.
//  Copyright © 2020 xinmei. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
@interface ViewController ()
@property (nonatomic, strong) UITextField *textField;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(100, 100, 100, 50)];
    self.textField.placeholder = @"123";
    
    [self.textField setValue:[UIColor redColor] forKeyPath:@"_placeholderLabel.textColor"];
    
    
    
    // 成员变量的数量
    unsigned int count ;
    Ivar *ivars  = class_copyIvarList([UITextField class], &count);
    
    for (int i=0 ; i < count; i++) {
        
        Ivar ivar = ivars[i];
        
        NSLog(@"%s---%s",ivar_getName(ivar),ivar_getTypeEncoding(ivar));
    }
    
    free(ivars);
    

    
    
}


@end
