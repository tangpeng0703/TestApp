//
//  StartPageView.m
//  MyApp
//
//  Created by 汤鹏 on 2018/6/7.
//  Copyright © 2018年 汤鹏. All rights reserved.
//

#import "StartPageView.h"

@interface StartPageView()

@property (nonatomic, copy) clickBlock block;
@property (nonatomic, strong) UIImageView *imageV;
@property (nonatomic, strong) UIButton *timeBtn;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, assign) int count;
@property (nonatomic, strong) NSArray *imageArray;

@end

static NSString * const imageName = @"imageName";
static int const totalTime = 5;//默认的倒计时时间

@implementation StartPageView

//定时器初始化
- (NSTimer *)timer{
    if (!_timer) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timeChange) userInfo:nil repeats:YES];
    }
    return _timer;
}

//定时器时间变动方法
- (void)timeChange{
    self.count--;
    [self.timeBtn setTitle:[NSString stringWithFormat:@"跳过%ds",self.count] forState:UIControlStateNormal];
    if (self.count <= 0) {
        [self disMiss];
    }
}

//定时器启动方法
- (void)startTime{
    self.count = totalTime;
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (instancetype)initWithFrame:(CGRect)frame withBlock:(clickBlock)block{
    if (self = [super initWithFrame:frame]) {
        
        self.imageV = [[UIImageView alloc] initWithFrame:frame];
        //imageView上加按钮，按钮点击没反应，设置这个属性为YES
        self.userInteractionEnabled = YES;
        //等比例缩放，意味着图片有可能周围会被裁掉
        self.contentMode = UIViewContentModeScaleAspectFill;
        self.clipsToBounds = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushTo)];
        [self.imageV addGestureRecognizer:tap];

        // 2.跳过按钮
        self.timeBtn = [[UIButton alloc] initWithFrame:CGRectMake(ScreenWidth - 60 - 20, 50, 60, 30)];
        [self.timeBtn addTarget:self action:@selector(disMiss) forControlEvents:UIControlEventTouchUpInside];
        [self.timeBtn setTitle:[NSString stringWithFormat:@"跳过%ds",totalTime] forState:UIControlStateNormal];
        self.timeBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [self.timeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.timeBtn.backgroundColor = [UIColor colorWithRed:38 /255.0 green:38 /255.0 blue:38 /255.0 alpha:0.6];
        self.timeBtn.layer.cornerRadius = 4;
        
        self.block = block;
        
        [self addSubview:self.imageV];
        [self addSubview:self.timeBtn];
        
        //下载最新广告图
        [self downloadImage];

    }
    return self;
}

//广告点击跳转
- (void)pushTo{
    
}

//展示广告图
- (void)showImage{
    // 这里就是做个容错处理
    if (totalTime <= 0) {
        return;
    }
    // 倒计时方法：定时器
    [self startTime];
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:self];
}

- (void)disMiss{
    [self.timer invalidate];
    self.timer = nil;

    [UIView animateWithDuration:0.3f animations:^{
        
        self.alpha = 0.f;
        
    } completion:^(BOOL finished) {
        
        [self removeFromSuperview];
        
    }];
}

//下载最新广告图
- (void)downloadImage{
    self.imageArray = @[@"WechatIMG.jpeg",@"WechatIMG3.jpeg",@"WechatIMG4.jpeg",@"WechatIMG5.jpeg"];
    NSString *name = self.imageArray[arc4random()%self.imageArray.count];
    //设置广告图
    self.imageV.image = [UIImage imageNamed:name];
    //展示广告图
    [self showImage];
}

@end
