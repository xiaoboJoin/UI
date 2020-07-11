//
//  IUProgressButton.m
//  UI
//
//  Created by xiao on 2020/7/11.
//  Copyright © 2020 xiao. All rights reserved.
//

#import "IUProgressButton.h"

#define TransformToDegree(x) (M_PI*(x)/180.0)

@interface IUProgressButton ()

@property (nonatomic, strong) CAShapeLayer* progressLayer;
@property (nonatomic, strong) CAShapeLayer* trackLayer;
@property(nonatomic,assign) CGFloat width;

@end

@implementation IUProgressButton

- (id)init
{
    self = [super init];
    if (self) {
        [self setupview];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupview];
    }
    return self;
}

- (id)initWithCoder:(NSCoder*)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setupview];
    }
    return self;
}

- (void)setupview
{
//    return;
    self.width = 1.0;
    self.trackLayer = [self circlelayer:[UIColor grayColor] width:1.0];
    self.progressLayer = [self circlelayer:[UIColor blueColor] width:1.0];
    [self.layer addSublayer:self.trackLayer];
    [self.layer addSublayer:self.progressLayer];
    self.progressLayer.strokeStart = 0.0f;
    self.progress = 0.0;
    self.imageEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 10);
}

- (CAShapeLayer*)circlelayer:(UIColor*)color width:(CGFloat)width
{
    CAShapeLayer* layer = [CAShapeLayer layer];
    layer.lineWidth = width;
    layer.frame = self.bounds;
    layer.fillColor = [[UIColor clearColor] CGColor];
    layer.strokeColor = color.CGColor;
    layer.lineCap = kCALineCapRound;
    return layer;
}

- (void)setHideProgress:(BOOL)hideProgress
{
    _hideProgress = hideProgress;
    if (_hideProgress) {
        [self.progressLayer setHidden:YES];
        [self.trackLayer setHidden:YES];
    }else{
        [self.progressLayer setHidden:NO];
        [self.trackLayer setHidden:NO];
    }
  
    
}

- (void)setProgress:(CGFloat)progress
{
    progress = progress < 0.0f ? 0.0f : progress;
    progress = progress > 1.0f ? 1.0f : progress;
    _progress = progress;
    [self update];
}
- (void)update
{
    [CATransaction begin];
//        [CATransaction setDisableActions:NO];
    [CATransaction setAnimationTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
    [CATransaction setAnimationDuration:1.0];
    
    _progressLayer.strokeEnd = _progress;
    [CATransaction commit];
}

- (void)layoutSubviews
{

    [super layoutSubviews];
    self.progressLayer.frame = self.bounds;
    self.trackLayer.frame = self.bounds;
    _trackLayer.lineWidth = _width;
    CGFloat radius = self.frame.size.width/2- _width;
    UIBezierPath *path=[UIBezierPath bezierPathWithArcCenter:CGPointMake(self.frame.size.width/2, self.frame.size.height/2) radius:radius startAngle:-M_PI_2 endAngle:M_PI+M_PI_2 clockwise:YES];
    _trackLayer.path=path.CGPath;
    _progressLayer.path = path.CGPath;
    _progressLayer.lineWidth = _width;
    
    // 画刻度
    //    UIBezierPath *fontPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.bounds.size.width/2.0, self.bounds.size.height/2.0) radius:self.bounds.size.height/2.0 startAngle:M_PI endAngle:M_PI*2 clockwise:YES];
    //    self.fontCircleLayer.path =  fontPath.CGPath;
    //    UIBezierPath *backPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.bounds.size.width/2.0, self.bounds.size.height/2.0) radius:self.bounds.size.height/2.0 startAngle:0 endAngle:M_PI*2 clockwise:YES];
    //    self.backCircleLayer.path =  backPath.CGPath;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
