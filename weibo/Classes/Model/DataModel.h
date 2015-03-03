//
//  DataModel.h
//  weibo
//
//  Created by medicool on 15/3/2.
//  Copyright (c) 2015年 ZK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataModel : NSObject
//内容
@property (nonatomic, copy) NSString *text;
//头像
@property (nonatomic, copy) NSString *icon;
//昵称
@property (nonatomic, copy) NSString *name;
//配图
@property (nonatomic, copy) NSString *picture;
//会员
@property (nonatomic, assign) BOOL vip;

- (instancetype)initWithDict:(NSDictionary *)dic;
+ (instancetype)dataModelWithDict:(NSDictionary *)dic;
@end
