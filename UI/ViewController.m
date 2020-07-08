//
//  ViewController.m
//  UI
//
//  Created by xiao on 2020/7/7.
//  Copyright © 2020 xiao. All rights reserved.
//

#import "ViewController.h"
#import <CocoaMarkdown/CocoaMarkdown.h>
#import <Masonry.h>

@interface ViewController ()
@property (nonatomic, strong) UITextView* textView;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.textView = [UITextView new];
    [self.view addSubview:self.textView];
    [self.textView mas_makeConstraints:^(MASConstraintMaker* make) {
        make.edges.equalTo(self.view).with.insets(UIEdgeInsetsZero);
    }];
    self.textView.contentInset = UIEdgeInsetsMake(0, 16, 0, 16);
    
    NSData *data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"test" ofType:@"md"]];

    CMDocument* document = [[CMDocument alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"test" ofType:@"md"]  options:CMDocumentOptionsSourcepos];

    CMAttributedStringRenderer* render = [[CMAttributedStringRenderer alloc] initWithDocument:document attributes:[CMTextAttributes new]];

//    [render registerHTMLElementTransformer:[CMHTMLStrikethroughTransformer new]]
    self.textView.attributedText = [render render];;
    //    [self.navigationController.navigationBar setTranslucent:NO];

    //    [self setEdgesForExtendedLayout:UIRectEdgeNone];

//    UIView* view = [UIView new];
//
//    view.frame = CGRectMake(0, 0, 100, 100);
//    view.backgroundColor = [UIColor redColor];
//    [self.view addSubview:view];

    // Do any additional setup after loading the view.
}

@end
