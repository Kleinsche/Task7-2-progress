//
//  ViewController.m
//  Task7-2
//
//  Created by 🍋 on 16/8/20.
//  Copyright © 2016年 🍋. All rights reserved.
//

#import "ViewController.h"
#import "CircleProgressView.h"

@interface ViewController ()

@property (nonatomic, strong) CircleProgressView *progressView;
@property (nonatomic,strong) UIView * img;
@property (nonatomic,strong) UISlider *slider;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addImage];
    [self addProgress];
    [self addSlider];
}


-(void)addSlider{
    UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake(75, 350, 150, 100)];
    slider.minimumValue = 0.0;
    slider.maximumValue = 1.0;
    slider.value = 0.2;
    [slider addTarget:self action:@selector(changeValue:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:slider];
}


-(void)addImage{
    CGRect rect = CGRectMake(100, 200, 100, 100);
    UIImageView *img = [[UIImageView alloc]initWithFrame:rect];
    img.image = [UIImage imageNamed:@"QQ.png"];
    img.layer.cornerRadius = 10;
    [self.view addSubview:img];
    self.img = img;
}


-(void)changeValue:(UISlider *)slider{
    self.progressView.progressValue = slider.value;
    self.slider = slider;
    [self addFinishAnimation];
}


-(void)addProgress{
    CircleProgressView *circleProgress = [CircleProgressView viewWithFrame:CGRectMake(0, 0, 100, 100) circlesSize:CGRectMake(35, 2, 30, 30)];
    circleProgress.layer.cornerRadius = 10;
    circleProgress.alpha = 0.5;
    circleProgress.foreCircle.strokeColor = [UIColor grayColor].CGColor;
    circleProgress.progressValue = 0.1;
    
    [self.img addSubview:circleProgress];
    self.progressView = circleProgress;
}


-(void)addFinishAnimation{
    [UIView beginAnimations:nil context:nil];
    if (self.slider.value >= 1) {
        self.progressView.alpha = 0;
    }else{
        self.progressView.alpha = 0.5;
    }
    [UIView commitAnimations];
}

@end
