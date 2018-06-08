//
//  AppDelegate+AppPayService.m
//  MyApp
//
//  Created by 汤鹏 on 2018/6/5.
//  Copyright © 2018年 汤鹏. All rights reserved.
//

#import "AppDelegate+AppPayService.h"

@implementation AppDelegate (AppPayService)

//初始化通知服务
- (void)initService{
    //注册登录状态监听
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(loginStateChange:)
                                                 name:LoginSuccess
                                               object:nil];
}

//初始化window
- (void)initWindow{
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = WhiteColor;
    [self.window makeKeyAndVisible];
    
    [[UIButton appearance] setExclusiveTouch:YES];
    [[UIButton appearance] setShowsTouchWhenHighlighted:YES];
    
    //修改整体某个类的属性的方法
    NSArray *array = [[NSArray alloc] initWithObjects:[MBProgressHUD class], nil];
    [UIActivityIndicatorView appearanceWhenContainedInInstancesOfClasses:array].color = WhiteColor;
    
    if (@available(iOS 11.0, *)){
        [[UIScrollView appearance] setContentInsetAdjustmentBehavior:UIScrollViewContentInsetAdjustmentNever];
    }
    
    NavViewController *nav = [[NavViewController alloc] initWithRootViewController:[LoginViewController new]];
    [self.window setRootViewController:nav];

}

- (void)loginStateChange:(NSNotification *)notice{
    BOOL success = [notice.object boolValue];
    if (success) {
        //为避免自动登录成功刷新tabbar
        if (!self.mainTabbar || ![self.window.rootViewController isKindOfClass:[MainTabbarViewController class]]) {
            self.mainTabbar = [MainTabbarViewController new];
            self.window.rootViewController = self.mainTabbar;
        }
    }
    else{
        self.mainTabbar = nil;
        NavViewController *nav = [[NavViewController alloc] initWithRootViewController:[LoginViewController new]];
        [self.window setRootViewController:nav];
    }
}

+ (AppDelegate *)shareAppDelegate{
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}

@end
