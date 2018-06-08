//
//  CommonDefine.h
//  MyApp
//
//  Created by 汤鹏 on 2018/6/6.
//  Copyright © 2018年 汤鹏. All rights reserved.
//

#ifndef CommonDefine_h
#define CommonDefine_h

#define WhiteColor [UIColor whiteColor]

//获取屏幕宽高
#define ScreenWidth  [[UIScreen mainScreen] bounds].size.width
#define ScreenHeight [[UIScreen mainScreen] bounds].size.height
#define ScreenBounds [UIScreen mainScreen].bounds

#define UserDefaults       [NSUserDefaults standardUserDefaults]
#define NotificationCenter [NSNotificationCenter defaultCenter]

//发送通知
#define PostNotification(name, obj) [NotificationCenter postNotificationName:name object:obj];

//登录状态改变通知
#define LoginSuccess @"loginSuccess"

#endif /* CommonDefine_h */
