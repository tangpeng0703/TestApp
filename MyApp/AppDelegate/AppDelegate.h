//
//  AppDelegate.h
//  MyApp
//
//  Created by 汤鹏 on 2018/6/5.
//  Copyright © 2018年 汤鹏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "MainTabbarViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, strong) MainTabbarViewController *mainTabbar;

@end

