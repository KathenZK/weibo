//
//  ModelCell.h
//  weibo
//
//  Created by medicool on 15/3/2.
//  Copyright (c) 2015年 ZK. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FrameModel;

@interface ModelCell : UITableViewCell

@property (nonatomic, copy) FrameModel *frameModel;
+ (instancetype)modelCellWithTableView:(UITableView *)tableView;

@end
