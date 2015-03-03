//
//  FrameModel.h
//  weibo
//
//  Created by medicool on 15/3/2.
//  Copyright (c) 2015年 ZK. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class DataModel;

@interface FrameModel : NSObject
//内容
@property (nonatomic, assign ,readonly) CGRect textF;
//头像
@property (nonatomic, assign ,readonly) CGRect iconF;
//昵称
@property (nonatomic, assign ,readonly) CGRect nameF;
//配图
@property (nonatomic, assign ,readonly) CGRect pictureF;
//会员
@property (nonatomic, assign ,readonly) CGRect vipF;
//cell的高度
@property (nonatomic, assign ,readonly) CGFloat cellHeight;
@property (nonatomic, copy) DataModel *dataModel;

@end
