//
//  ViewController.m
//  UI
//
//  Created by xiao on 2020/7/7.
//  Copyright © 2020 xiao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    　
//    [self.navigationController.navigationBar setTranslucent:NO];
    

//    [self setEdgesForExtendedLayout:UIRectEdgeNone];
    

    UIView *view = [UIView new];
    
    view.frame = CGRectMake(0, 0, 100, 100);
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
    
    // Do any additional setup after loading the view.
}


@end
