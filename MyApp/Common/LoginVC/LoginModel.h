//
//  LoginModel.h
//  MyApp
//
//  Created by 汤鹏 on 2018/6/8.
//  Copyright © 2018年 汤鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginModel : NSObject

@property (nonatomic, copy) NSString *userName;
@property (nonatomic, copy) NSString *passWord;

@property (nonatomic, strong) RACSignal *loginButtonEnableSignal;
@property (nonatomic, strong) RACCommand *loginCommad;

@end
