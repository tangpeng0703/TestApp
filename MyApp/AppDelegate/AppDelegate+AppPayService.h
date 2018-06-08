//
//  AppDelegate+AppPayService.h
//  MyApp
//
//  Created by 汤鹏 on 2018/6/5.
//  Copyright © 2018年 汤鹏. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate (AppPayService)

//初始化通知服务
- (void)initService;

//初始化window
- (void)initWindow;

+ (AppDelegate *)shareAppDelegate;

@end
