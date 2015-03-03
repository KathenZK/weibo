//
//  DataModel.m
//  weibo
//
//  Created by medicool on 15/3/2.
//  Copyright (c) 2015年 ZK. All rights reserved.
//

#import "DataModel.h"

@implementation DataModel

- (instancetype)initWithDict:(NSDictionary *)dic{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}
+ (instancetype)dataModelWithDict:(NSDictionary *)dic
{
    return [[self alloc]initWithDict:dic];
}
@end
