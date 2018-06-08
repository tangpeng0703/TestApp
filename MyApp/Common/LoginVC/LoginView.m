//
//  LoginView.m
//  MyApp
//
//  Created by 汤鹏 on 2018/6/8.
//  Copyright © 2018年 汤鹏. All rights reserved.
//

#import "LoginView.h"

@implementation LoginView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setUI];
    }
    return self;
}

- (UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.text = @"用户名";
        _nameLabel.backgroundColor = [UIColor redColor];
    }
    return _nameLabel;
}

- (UILabel *)psdLabel{
    if (!_psdLabel) {
        _psdLabel = [[UILabel alloc] init];
        _psdLabel.text = @"密码";
        _psdLabel.backgroundColor = [UIColor redColor];
    }
    return _psdLabel;
}

- (UITextField *)nameText{
    if (!_nameText) {
        _nameText = [[UITextField alloc] init];
        _nameText.placeholder = @"请输入用户名";
        _nameText.backgroundColor = [UIColor redColor];

    }
    return _nameText;
}

- (UITextField *)psdText{
    if (!_psdText) {
        _psdText = [[UITextField alloc] init];
        _psdText.placeholder = @"请输入密码";
        _psdText.backgroundColor = [UIColor redColor];
    }
    return _psdText;
}

- (UIButton *)loginBtn{
    if (!_loginBtn) {
        _loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _loginBtn.backgroundColor = [UIColor yellowColor];
        _loginBtn.layer.cornerRadius = 10;
        _loginBtn.layer.masksToBounds = YES;
        [_loginBtn setTitle:@"登   录" forState:UIControlStateNormal];
        [_loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_loginBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
        [_loginBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateDisabled];
        _loginBtn.enabled = NO;
    }
    return _loginBtn;
}

- (void)setUI{
    [self addSubview:self.nameLabel];
    [self addSubview:self.psdLabel];
    [self addSubview:self.nameText];
    [self addSubview:self.psdText];
    [self addSubview:self.loginBtn];
}

- (void)layoutSubviews{
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(60);
        make.height.mas_equalTo(30);
        make.top.mas_equalTo(self).offset(60);
        make.left.mas_equalTo(self).offset(20);
    }];
    
    [self.nameText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(self.nameLabel.mas_height);
        make.centerY.mas_equalTo(self.nameLabel.mas_centerY);
        make.left.mas_equalTo(self.nameLabel.mas_right).offset(10);
        make.right.mas_equalTo(self).offset(-20);
    }];
    
    [self.psdLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(self.nameLabel.mas_height);
        make.top.mas_equalTo(self.nameLabel.mas_bottom).offset(30);
        make.leading.mas_equalTo(self.nameLabel);
        make.trailing.mas_equalTo(self.nameLabel);
    }];
    
    [self.psdText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(self.nameLabel.mas_height);
        make.centerY.mas_equalTo(self.psdLabel.mas_centerY);
        make.leading.mas_equalTo(self.nameText);
        make.trailing.mas_equalTo(self.nameText);
    }];

    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(40);
        make.top.mas_equalTo(self.psdLabel.mas_bottom).offset(30);
        make.leading.mas_equalTo(self.psdLabel);
        make.trailing.mas_equalTo(self.psdText);
    }];

}

@end
