//
//  StaticTools.m
//  MyApp
//
//  Created by 汤鹏 on 2018/6/8.
//  Copyright © 2018年 汤鹏. All rights reserved.
//

#import "StaticTools.h"

@implementation StaticTools

/**
 *  判断文件是否存在
 */
+ (BOOL)isFileExistWithFilePath:(NSString *)filePath
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL isDirectory = FALSE;
    return [fileManager fileExistsAtPath:filePath isDirectory:&isDirectory];
}

/**
 *  删除旧图片
 */
+ (BOOL)deleteOldImageWithImageName:(NSString *)imageName
{
    NSString *name = [UserDefaults valueForKey:imageName];
    if (name) {
        NSString *filePath = [self getFilePathWithImageName:name];
        NSFileManager *fileManager = [NSFileManager defaultManager];
        [fileManager removeItemAtPath:filePath error:nil];
    }
    
    return YES;
}

/**
 *  根据图片名拼接文件路径
 */
+ (NSString *)getFilePathWithImageName:(NSString *)imageName
{
    if (imageName) {
        
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask, YES);
        NSString *filePath = [[paths objectAtIndex:0] stringByAppendingPathComponent:imageName];
        
        return filePath;
    }
    
    return nil;
}

@end
