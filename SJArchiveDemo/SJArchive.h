//
//  SJArchive.h
//  SJArchiveDemo
//
//  Created by SPIREJ on 16/1/27.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kUserInfoFileName  @"user.db"
#define kUserInfoDataKey  @"userInfo"

#import "SJUserModel.h"
#import "AppDelegate.h"

@interface SJArchive : NSObject

/**用户信息归档*/
+ (void)archiverUserInfo:(SJUserModel *)model;
/**用户信息读档*/
+ (SJUserModel *)currentArchiverUserInfo;
@end
