//
//  StaticTools.h
//  MyApp
//
//  Created by 汤鹏 on 2018/6/8.
//  Copyright © 2018年 汤鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StaticTools : NSObject

/**
 *  判断文件是否存在
 */
+ (BOOL)isFileExistWithFilePath:(NSString *)filePath;

/**
 *  删除旧图片
 */
+ (BOOL)deleteOldImageWithImageName:(NSString *)imageName;

/**
 *  根据图片名拼接文件路径
 */
+ (NSString *)getFilePathWithImageName:(NSString *)imageName;

@end
