//
//  MainTabbarViewController.m
//  MyApp
//
//  Created by 汤鹏 on 2018/6/8.
//  Copyright © 2018年 汤鹏. All rights reserved.
//

#import "MainTabbarViewController.h"
#import "LiveViewController.h"
#import "MapsViewController.h"
#import "PushViewController.h"
#import "MineViewController.h"
#import "MoreViewController.h"

@interface MainTabbarViewController ()<UITabBarControllerDelegate>

@property (nonatomic,strong) NSMutableArray * vcArray;//tabbar root VC

@end

@implementation MainTabbarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.delegate = self;
    
    //设置tabbar
    [self setTabbar];
    
    //设置控制器
    [self setController];
}
- (void)setTabbar{
    [self.tabBar setBackgroundColor:[UIColor whiteColor]];
    [self.tabBar setBackgroundImage:[UIImage new]];
}

#pragma mark  ———— 初始化VC ————
-(void)setController{
    self.vcArray = @[].mutableCopy;
    
    LiveViewController *liveVC = [[LiveViewController alloc]init];
    [self setupChildViewController:liveVC title:@"直播" imageName:@"" seleceImageName:@""];
    
    MapsViewController *mapsVC = [[MapsViewController alloc]init];
    [self setupChildViewController:mapsVC title:@"地图" imageName:@"" seleceImageName:@""];
    
    PushViewController *pushVC = [PushViewController new];
    [self setupChildViewController:pushVC title:@"推送" imageName:@"" seleceImageName:@""];
    
    
    MineViewController *mineVC = [[MineViewController alloc]init];
    [self setupChildViewController:mineVC title:@"我的" imageName:@"" seleceImageName:@""];
    
    MoreViewController *moreVC = [[MoreViewController alloc]init];
    [self setupChildViewController:moreVC title:@"更多" imageName:@"" seleceImageName:@""];

    self.viewControllers = self.vcArray;
}

-(void)setupChildViewController:(UIViewController*)controller title:(NSString *)title imageName:(NSString *)imageName seleceImageName:(NSString *)selectImageName{
    //controller的标题
    controller.title = title;
    
    //为选中时的图片
    controller.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //选中时的图片
    controller.tabBarItem.selectedImage = [[UIImage imageNamed:selectImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //未选中字体颜色
    [controller.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor redColor],NSFontAttributeName:[UIFont systemFontOfSize:12.0f]} forState:UIControlStateNormal];
    
    //选中字体颜色
    [controller.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor greenColor],NSFontAttributeName:[UIFont systemFontOfSize:12.0f]} forState:UIControlStateSelected];
    
    //包装导航控制器
    NavViewController *nav = [[NavViewController alloc]initWithRootViewController:controller];
    
    [self.vcArray addObject:nav];
    
}


-(void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    //    NSLog(@"选中 %ld",tabBarController.selectedIndex);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
