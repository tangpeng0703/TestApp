//
//  LoginModel.m
//  MyApp
//
//  Created by 汤鹏 on 2018/6/8.
//  Copyright © 2018年 汤鹏. All rights reserved.
//

#import "LoginModel.h"

@interface LoginModel()

@end

@implementation LoginModel

- (instancetype)init{
    if (self = [super init]) {
        [self setup];
    }
    return self;
}

- (void)setup{
    self.loginButtonEnableSignal = [RACSignal combineLatest:@[RACObserve(self, self.userName), RACObserve(self, self.passWord)] reduce:^id(NSString *username, NSString *password){
        return @(username.length && password.length);
    }];
    
    self.loginCommad = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
            [subscriber sendNext:nil];
            [subscriber sendCompleted];
            return nil;
        }];
    }];
    
    [self.loginCommad.executionSignals.switchToLatest subscribeNext:^(id  _Nullable x) {
        PostNotification(LoginSuccess, @YES);
    }];
    
    [[self.loginCommad.executing skip:1] subscribeNext:^(NSNumber * _Nullable x) {
        
    }];

}

@end
