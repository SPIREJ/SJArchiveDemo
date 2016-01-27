//
//  SJUserModel.h
//  SJArchiveDemo
//
//  Created by SPIREJ on 16/1/27.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SJUserModel : NSObject<NSCoding>

@property(nonatomic, copy)NSString *userName;
@property(nonatomic, copy)NSString *userPhone;
@property(nonatomic, assign)NSInteger userAge;
+ (SJUserModel *)userWithName:(NSString *)name age:(NSInteger)age phone:(NSString *)phone;

@end
