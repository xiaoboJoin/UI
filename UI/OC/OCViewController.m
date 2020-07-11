//
//  OCViewController.m
//  UI
//
//  Created by xiao on 2020/7/11.
//  Copyright © 2020 xiao. All rights reserved.
//

#import "OCViewController.h"
#import "Person.h"

@interface OCViewController ()

@end

@implementation OCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Person *p = [Person new];
    p[@"name"] = @"jack";
    
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"－－－%@",[NSThread callStackSymbols]);
        
        NSLog(@"%@",p);
    });
    
    dispatch_after(1, dispatch_get_main_queue(), ^{
        NSLog(@"－－－%@",[NSThread callStackSymbols]);
         NSLog(@"%@",p);
    });
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
     NSLog(@"－－－%@",[NSThread callStackSymbols]);
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
