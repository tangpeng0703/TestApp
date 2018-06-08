//
//  NavViewController.m
//  MyApp
//
//  Created by 汤鹏 on 2018/6/7.
//  Copyright © 2018年 汤鹏. All rights reserved.
//

#import "NavViewController.h"

@interface NavViewController ()

@end

@implementation NavViewController

+ (void)initialize {
    UINavigationBar *navBar = [UINavigationBar appearance];
//    [navBar setBarTintColor:[UIColor greenColor]];
    [navBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor redColor], NSFontAttributeName:[UIFont systemFontOfSize:18]}];
    [navBar setBackgroundImage:[UIImage imageWithColor:[UIColor greenColor]] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];

    [navBar setShadowImage:[UIImage new]];
    [navBar setTranslucent:NO];
    //iOS 7.0以前
//    [navBar setTintColor:[UIColor redColor]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
