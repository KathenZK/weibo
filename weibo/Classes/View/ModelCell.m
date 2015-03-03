//
//  ModelCell.m
//  weibo
//
//  Created by medicool on 15/3/2.
//  Copyright (c) 2015年 ZK. All rights reserved.
//
#define NAMEFONT [UIFont systemFontOfSize:14]
#define TEXTFONT [UIFont systemFontOfSize:15]

#import "ModelCell.h"
#import "FrameModel.h"
#import "DataModel.h"

@interface ModelCell ()
//头像
@property (nonatomic, weak) UIImageView *iconView;
//昵称
@property (nonatomic, weak) UILabel *nameView;
//会员图标
@property (nonatomic, weak) UIImageView *vipView;
//正文
@property (nonatomic, weak) UILabel *textView;
//配图
@property (nonatomic, weak) UIImageView *pictureView;
@end

@implementation ModelCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //头像
        UIImageView *iconView = [[UIImageView alloc]init];
        [self.contentView addSubview:iconView];
        self.iconView = iconView;
        
        // 2.昵称
        UILabel *nameView = [[UILabel alloc] init];
        nameView.font = NAMEFONT;
        [self.contentView addSubview:nameView];
        self.nameView = nameView;
        
        // 3.会员图标
        UIImageView *vipView = [[UIImageView alloc] init];
        vipView.image = [UIImage imageNamed:@"vip"];
        [self.contentView addSubview:vipView];
        self.vipView = vipView;
        
        // 4.正文
        UILabel *textView = [[UILabel alloc] init];
        textView.numberOfLines = 0;
        textView.font = TEXTFONT;
        [self.contentView addSubview:textView];
        self.textView = textView;
        
        // 5.配图
        UIImageView *pictureView = [[UIImageView alloc] init];
        [self.contentView addSubview:pictureView];
        self.pictureView = pictureView;
    }
    return self;
}

+ (instancetype)modelCellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"cellID";
    ModelCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[ModelCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];;
    }
    return cell;
}

-(void)setFrameModel:(FrameModel *)frameModel
{
    _frameModel = frameModel;
    //设置数据
    [self settingData];
    //设值frame
    [self settingFrame];
}

- (void)settingData
{
    //数据
    DataModel *dataModel = self.frameModel.dataModel;
    
    self.iconView.image = [UIImage imageNamed:dataModel.icon];
    self.nameView.text = dataModel.name;
    if (dataModel.vip) {
        self.vipView.hidden = NO;
        self.nameView.textColor = [UIColor redColor];
    }
    else
    {
        self.vipView.hidden = YES;
        self.nameView.textColor = [UIColor blackColor];
    }
    self.textView.text = dataModel.text;
    if (dataModel.picture) {
        self.pictureView.hidden = NO;
        self.pictureView.image = [UIImage imageNamed:dataModel.picture];
    }
    else
    {
        self.pictureView.hidden = YES;
    }
    
}

- (void)settingFrame
{
    self.iconView.frame = self.frameModel.iconF;
    self.nameView.frame = self.frameModel.nameF;
    self.vipView.frame = self.frameModel.vipF;
    self.textView.frame = self.frameModel.textF;
    if (self.frameModel.dataModel.picture) {
        self.pictureView.frame = self.frameModel.pictureF;
    }
}
@end
