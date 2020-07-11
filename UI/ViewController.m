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
#import "IUProgressButton.h"

@interface ViewController ()
@property (nonatomic, strong) UITextView* textView;
@property (nonatomic, strong) UIWindow* window;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"红色";
//    self.view.backgroundColor = [UIColor redColor];
    IUProgressButton *progress = [IUProgressButton buttonWithType:UIButtonTypeCustom];
    [progress setImage:[UIImage imageNamed:@"icon_applyskill_voice_record"] forState:UIControlStateNormal];
    [self.view addSubview:progress];
    [progress mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.height.width.mas_equalTo(80);
    }];
    
    __block NSInteger limit = 0;
    [NSTimer scheduledTimerWithTimeInterval:1.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
        limit++;
        if (limit>15) {
            [timer invalidate];
            timer = nil;
        }
//        progress.hideProgress = !progress.hideProgress;
        progress.progress = limit/15.0;
    }];
    
    
    UIButton *img = [UIButton buttonWithType:UIButtonTypeCustom];
    [img setImage:[UIImage imageNamed:@"icon_applyskill_voice_record"] forState:UIControlStateNormal];
    [img setFrame:CGRectMake(100,100, 70, 70)];
    [self.view addSubview:img];
    
    
//    RACObserve() = 
    
//        [self.navigationController.navigationBar setTranslucent:NO];
//
//    //    [self setEdgesForExtendedLayout:UIRectEdgeNone];
//
//        UIView* view = [UIView new];
//
//        view.frame = CGRectMake(0, 0, 100, 100);
//        view.backgroundColor = [UIColor redColor];
//        [self.view addSubview:view];
//
//    CAShapeLayer * layer = [[CAShapeLayer alloc]init];
//    layer.frame = view.bounds;
//    layer.fillColor = [[UIColor blackColor] CGColor];
//
//    layer.path = CGPathCreateWithRect(CGRectMake(10, 10, 30, 30), NULL);
//
//    view.layer.mask = layer;
//
//    [self barAnimation];
    
//    CAShapeLayer *maskLayer = [CAShapeLayer layer];
//    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:view.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(16, 16)];
//    maskLayer.frame = view.bounds;
//    maskLayer.path = bezierPath.CGPath;
//
//    view.layer.mask=maskLayer;
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch*>*)touches withEvent:(UIEvent*)event
{
    UIViewController *vc = [UIViewController new];
    vc.view.backgroundColor = [UIColor blueColor];
    vc.title = @"蓝色";
    [self.navigationController pushViewController:vc animated:YES];
}


- (void)barAnimation {
    
        //  背景 layer
    CAReplicatorLayer * repLayer = [[CAReplicatorLayer alloc] init];
    repLayer.frame = CGRectMake(150, 40, 60, 60);
    repLayer.backgroundColor = [UIColor lightGrayColor].CGColor;
    [self.view.layer addSublayer:repLayer];
    
        //  1、单条 柱形  (原始层)
    CALayer * barLayer = [CALayer layer];
    barLayer.bounds = CGRectMake(0, 0, 8, 40);
    barLayer.position = CGPointMake(10, 75);
    barLayer.cornerRadius = 2.0;
    barLayer.backgroundColor = [UIColor redColor].CGColor;
        //  加在 replicator layer 上的 layer 可以复制
    [repLayer addSublayer:barLayer];
    
    CABasicAnimation * moveAnimation = [CABasicAnimation animationWithKeyPath:@"position.y"];
    moveAnimation.toValue = @(barLayer.position.y - 35);
    moveAnimation.duration = 0.5;
    moveAnimation.autoreverses = YES;
    moveAnimation.repeatCount = INFINITY;
    [barLayer addAnimation:moveAnimation forKey:@"moveAnimation"];
    
        //   1、设置 replicator 拷贝 为 3份(包括原来的)
        //      拷贝默认 会出现在相同的位置
    repLayer.instanceCount = 3;
    
        //  2、设置每个 拷贝的 位移 (x 上 右移20)
        //      会同时移动
    repLayer.instanceTransform = CATransform3DMakeTranslation(20, 0, 0);
    
        //  3、设置 延迟
    repLayer.instanceDelay = 0.33;
    
        //  超出边界的不显示
    repLayer.masksToBounds = YES;
    
}

- (void)indicatorAnimation {
    
        //  背景 layer
    CAReplicatorLayer * repLayer = [CAReplicatorLayer layer];
    repLayer.frame = CGRectMake(80, 130, 200, 200);
    repLayer.cornerRadius = 10;
    repLayer.backgroundColor = [UIColor colorWithWhite:0 alpha:0.75].CGColor;
    [self.view.layer addSublayer:repLayer];
    
        //  单个小方块 （原始层）
    CALayer * dotLayer = [CALayer layer];
    dotLayer.bounds = CGRectMake(0, 0, 14, 14);
    dotLayer.position = CGPointMake(100, 40);
    dotLayer.cornerRadius = 2;
    dotLayer.backgroundColor = [UIColor colorWithWhite:0.8 alpha:1].CGColor;
    dotLayer.borderColor = [UIColor colorWithWhite:1.0 alpha:1].CGColor;
        //  加在 replicator layer 上的 layer 可以复制
    [repLayer addSublayer:dotLayer];
    
    
        //  1、设置 拷贝份数、旋转
    int dotsNum = 15;
    CGFloat angle = 2 * M_PI / 15;
    repLayer.instanceCount = dotsNum;
    repLayer.instanceTransform = CATransform3DMakeRotation(angle, 0, 0, 1);
    
    
    CFTimeInterval duration = 1.5;
    
        //  2、设置了 动画后, 每个点 会同时 执行 变大变小
    CABasicAnimation * shrinkAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    shrinkAnimation.fromValue = @(1.0);
    shrinkAnimation.toValue = @(0.1);
    shrinkAnimation.duration = duration;
    shrinkAnimation.repeatCount = INFINITY;
        //    shrinkAnimation.autoreverses = YES;     //    TODO: 打开这行,看看效果
    [dotLayer addAnimation:shrinkAnimation forKey:nil];
    
        //  3、设置 每个点的 延时 （会逐个自动添加上）
    repLayer.instanceDelay = duration / dotsNum;    // TODO: 注释掉试试
    
    dotLayer.transform = CATransform3DMakeTranslation(0.01, 0.01, 0.01);
    
}

#pragma mark - 动画三

- (void)logoAnimation {
    
        //  背景 layer
    CAReplicatorLayer * repLayer = [CAReplicatorLayer layer];
    repLayer.frame = CGRectMake(20, 350, 330, 300);
    repLayer.cornerRadius = 10;
    repLayer.backgroundColor = [UIColor colorWithWhite:0 alpha:0.75].CGColor;
    
    [self.view.layer addSublayer:repLayer];
    
        //  1、单个 原点： 原始层
    CALayer * dotLayer = [CALayer layer];
    dotLayer.frame = CGRectMake(0, 0, 10, 10);
        //    dotLayer.position = CGPointMake(100, 40);
    dotLayer.cornerRadius = 5;
    dotLayer.borderWidth = 1;
    dotLayer.backgroundColor = [UIColor colorWithWhite:0.8 alpha:1].CGColor;
    dotLayer.borderColor = [UIColor colorWithWhite:1.0 alpha:1].CGColor;
        //  Rasterize 光栅栏 效果
    dotLayer.shouldRasterize = YES;
        //  加在 replicator layer 上的 layer 可以复制
    [repLayer addSublayer:dotLayer];
    
        //  2、只是为一个点添加了动画
    CAKeyframeAnimation * animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
        //  设置动画的路径 为 设置好的 贝塞尔曲线
    animation.path = [self creatBezierPath];
    animation.repeatCount = INFINITY;
    animation.duration = 4;
    [dotLayer addAnimation:animation forKey:nil];
    
        //  3、拷贝图层、设置延时
    repLayer.instanceDelay = 0.1;
    repLayer.instanceCount = 20;
    
        //  4、改变颜色、设置颜色的 偏移
    repLayer.instanceColor = [UIColor colorWithRed:0 green:1 blue:0 alpha:1].CGColor;
        //    repLayer.instanceGreenOffset = -0.03;
    
    
}

    //  利用 pinterCode 软件 计算好路径  ( // TODO:这里路径由于是固定的，可能会跑到背景图外部)
- (CGPathRef)creatBezierPath {
    
    UIBezierPath * bezierPath = [UIBezierPath bezierPath];
    
    [bezierPath moveToPoint:CGPointMake(31.5,71.5)];
    [bezierPath addLineToPoint:CGPointMake(31.5,23.5)];
    [bezierPath addCurveToPoint:CGPointMake(58.5, 38.5)
                  controlPoint1:CGPointMake(31.5,23.5)
                  controlPoint2:CGPointMake(62.46,18.69)];
    [bezierPath addCurveToPoint:CGPointMake(53.5,45.5)
                  controlPoint1:CGPointMake(57.5,43.5)
                  controlPoint2:CGPointMake(53.5,45.5)];
    [bezierPath addLineToPoint:CGPointMake(43.5,48.5)];
    [bezierPath addLineToPoint:CGPointMake(53.5,66.5)];
    [bezierPath addLineToPoint:CGPointMake(62.5,51.5)];
    [bezierPath addLineToPoint:CGPointMake(70.5,66.5)];
    [bezierPath addLineToPoint:CGPointMake( 86.5,23.5)];
    [bezierPath addLineToPoint:CGPointMake(86.5,78.5)];
    [bezierPath addLineToPoint:CGPointMake(31.5,78.5)];
    [bezierPath addLineToPoint:CGPointMake(31.5,71.5)];
    [bezierPath closePath];
    
        //  放大
    CGAffineTransform scale = CGAffineTransformMakeScale(3, 3);
    
        //  生成 CGPath 拷贝 （副本）
    CGPathRef pathRef = CGPathCreateCopyByTransformingPath(bezierPath.CGPath, &scale);
    return pathRef;
}

- (void)showMarkdown
{
    self.textView = [UITextView new];
    [self.view addSubview:self.textView];
    [self.textView mas_makeConstraints:^(MASConstraintMaker* make) {
        make.edges.equalTo(self.view).with.insets(UIEdgeInsetsZero);
    }];
    self.textView.contentInset = UIEdgeInsetsMake(0, 16, 0, 16);

    NSData* data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"test" ofType:@"md"]];

    CMDocument* document = [[CMDocument alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"test" ofType:@"md"] options:CMDocumentOptionsSourcepos];

    CMAttributedStringRenderer* render = [[CMAttributedStringRenderer alloc] initWithDocument:document attributes:[CMTextAttributes new]];

    //    [render registerHTMLElementTransformer:[CMHTMLStrikethroughTransformer new]]
    self.textView.attributedText = [render render];
}

//- (void)disableWindowAction
//{
//
//}



@end
