//
//  LoginViewController.m
//  MyApp
//
//  Created by 汤鹏 on 2018/6/7.
//  Copyright © 2018年 汤鹏. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginView.h"
#import "LoginModel.h"

@interface LoginViewController ()

@property (nonatomic,strong)LoginView *loginView;
@property (nonatomic,strong)LoginModel *loginModel;

@end

@implementation LoginViewController

- (LoginView *)loginView{
    if (!_loginView) {
        _loginView = [[LoginView alloc] init];
    }
    return _loginView;
}

- (LoginModel *)loginModel{
    if (!_loginModel) {
        _loginModel = [[LoginModel alloc] init];
    }
    return _loginModel;
}

- (void)loadView{
    self.view = self.loginView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"登录";
    
    //登录按钮的响应
    [self loginButtonEnable];
    
    //登录按钮的点击事件
    [self loginButtonAction];
}

- (void)loginButtonEnable{
    RAC(self.loginModel, userName) = self.loginView.nameText.rac_textSignal;
    RAC(self.loginModel, passWord) = self.loginView.psdText.rac_textSignal;
    RAC(self.loginView.loginBtn, enabled) = self.loginModel.loginButtonEnableSignal;
}

- (void)loginButtonAction{
    [[self.loginView.loginBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        [self.loginModel.loginCommad execute:nil];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
