//
//  CircleProgressView.h
//  Task7-2
//
//  Created by 🍋 on 16/8/20.
//  Copyright © 2016年 🍋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CircleProgressView : UIView

@property (nonatomic, assign) CGFloat progressValue;
@property (nonatomic, strong) CAShapeLayer *backCircle;
@property (nonatomic, strong) CAShapeLayer *foreCircle;
@property (nonatomic, assign) CGRect circlesSize;

+ (instancetype)viewWithFrame:(CGRect)frame circlesSize:(CGRect)size;
- (instancetype)initWithFrame:(CGRect)frame circlesSize:(CGRect)size;

-(void)addBackCircle:(CGFloat)radius lineWidth:(CGFloat)lineWidth;
-(void)addForeCircle:(CGFloat)radius lineWidth:(CGFloat)lineWidth;
-(CAShapeLayer *)createShapeLayer:(CGFloat)radius lineWith:(CGFloat)lineWidth;
-(void)setProgressValue:(CGFloat)progressValue;

@end
