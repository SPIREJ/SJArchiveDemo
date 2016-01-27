//
//  SJArchive.m
//  SJArchiveDemo
//
//  Created by SPIREJ on 16/1/27.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import "SJArchive.h"

@implementation SJArchive

+ (void)archiverUserInfo:(SJUserModel *)model{
    [self archiverModel:model fileName:kUserInfoFileName dataName:kUserInfoDataKey];
}

+(SJUserModel *)currentArchiverUserInfo{
    //如果内存中有UserModel,直接读取，否则去磁盘读取
    if ([self memoryUserInfo] != nil) {
        return [self memoryUserInfo];
    }
    return [self unArchiverWithFieldName:kUserInfoFileName dataName:kUserInfoDataKey];
}
/**获取当前内存中的用户信息*/
+ (SJUserModel *)memoryUserInfo{
    AppDelegate *delegate = [UIApplication sharedApplication].delegate;
    return delegate.currentUserModel;
}

+ (void)archiverModel:(NSObject *)model fileName:(NSString *)fileName dataName:(NSString *)dataName{
    NSString *dataFilePath = [self filePathComponentName:fileName];
    NSMutableData *data = [[NSMutableData alloc] init];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    
    [archiver encodeObject:model forKey:dataName];
    [archiver finishEncoding];
    [data writeToFile:dataFilePath atomically:YES];
}

+ (id)unArchiverWithFieldName:(NSString *)fileName dataName:(NSString *)dataName{
    NSString *filePath = [self filePathComponentName:fileName];
    NSData *data = [[NSMutableData alloc] initWithContentsOfFile:filePath];
    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
    id model = [unarchiver decodeObjectForKey:dataName];
    [unarchiver finishDecoding];
    if (model == nil) {
        NSLog(@"读档信息为空");
    }
    return model;
}
/**路径*/
+ (NSString *)filePathComponentName:(NSString *)fileName{
    return [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)objectAtIndex:0] stringByAppendingPathComponent:fileName];
}

@end
