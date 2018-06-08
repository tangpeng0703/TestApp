//
//  StartPageView.h
//  MyApp
//
//  Created by 汤鹏 on 2018/6/7.
//  Copyright © 2018年 汤鹏. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^clickBlock)(void);

@interface StartPageView : UIView

- (instancetype)initWithFrame:(CGRect)frame withBlock:(clickBlock)block;

@end
