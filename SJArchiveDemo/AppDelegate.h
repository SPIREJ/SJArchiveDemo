//
//  AppDelegate.h
//  SJArchiveDemo
//
//  Created by SPIREJ on 16/1/27.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SJUserModel.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) SJUserModel *currentUserModel;


@end

