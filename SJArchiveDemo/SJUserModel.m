//
//  SJUserModel.m
//  SJArchiveDemo
//
//  Created by SPIREJ on 16/1/27.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import "SJUserModel.h"

@implementation SJUserModel

+ (SJUserModel *)userWithName:(NSString *)name age:(NSInteger)age phone:(NSString *)phone{
    SJUserModel *model = [[self alloc] init];
    model.userName = name;
    model.userAge = age;
    model.userPhone = phone;
    return model;
}

/**归档会自动触发*/
- (void)encodeWithCoder:(NSCoder *)aCoder{
    //保存值
    [aCoder encodeObject:self.userName forKey:@"userName"];
    [aCoder encodeObject:self.userPhone forKey:@"userPhone"];
    [aCoder encodeInteger:self.userAge forKey:@"userAge"];
}
/**解归档会自动触发*/
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]) {
        //取值
        self.userName = [aDecoder decodeObjectForKey:@"userName"];
        self.userPhone = [aDecoder decodeObjectForKey:@"userPhone"];
        self.userAge = [aDecoder decodeIntegerForKey:@"userAge"];
    }
    return self;
}
@end
