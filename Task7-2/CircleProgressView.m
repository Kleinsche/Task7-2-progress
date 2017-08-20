//
//  CircleProgressView.m
//  Task7-2
//
//  Created by 🍋 on 16/8/20.
//  Copyright © 2016年 🍋. All rights reserved.
//

#import "CircleProgressView.h"

@implementation CircleProgressView

+(instancetype)viewWithFrame:(CGRect)frame circlesSize:(CGRect)size{
    return [[self alloc] initWithFrame:frame circlesSize:size];
}

- (instancetype)initWithFrame:(CGRect)frame circlesSize:(CGRect)size
{
    self = [super initWithFrame:frame];
    if (self) {
        self.circlesSize = size;
        [self initView];
    }
    return self;
}


-(void)initView{
    self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    [self addBackCircle:self.circlesSize.origin.x lineWidth:self.circlesSize.origin.y];
    [self addForeCircle:self.circlesSize.size.width lineWidth:self.circlesSize.size.height];
}


//外环
-(void)addBackCircle:(CGFloat)radius lineWidth:(CGFloat)lineWidth{
    self.backCircle = [self createShapeLayer:radius lineWith:lineWidth];
    [self.layer addSublayer:self.backCircle];
}


//进度条
-(void)addForeCircle:(CGFloat)radius lineWidth:(CGFloat)lineWidth{
    self.foreCircle = [self createShapeLayer:radius lineWith:lineWidth];
    
    self.foreCircle.path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(radius, radius)
                                                          radius:radius-lineWidth/2
                                                      startAngle:-M_PI/2
                                                        endAngle:-M_PI/180*450
                                                       clockwise:NO].CGPath;
    [self.layer addSublayer:self.foreCircle];
}

//创建圆环
-(CAShapeLayer *)createShapeLayer:(CGFloat)radius lineWith:(CGFloat)lineWidth{
    CGRect frame = CGRectMake(self.bounds.size.width/2-radius,
                              self.bounds.size.height/2-radius,
                              radius*2,
                              radius*2);
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.frame = frame;
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(radius, radius)
                                                        radius:radius-lineWidth/2
                                                    startAngle:0
                                                      endAngle:M_PI*2
                                                     clockwise:nil];
    
    layer.path = path.CGPath;
//    layer.fillColor = [UIColor whiteColor].CGColor;
//    layer.strokeColor = [UIColor whiteColor].CGColor;
    layer.lineWidth = lineWidth;
    
    return layer;
}

//设置进度条值
-(void)setProgressValue:(CGFloat)progressValue{
    if (self.foreCircle) {
        self.foreCircle.strokeEnd = 1-progressValue;
    }
}

@end
