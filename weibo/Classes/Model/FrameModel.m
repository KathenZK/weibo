//
//  FrameModel.m
//  weibo
//
//  Created by medicool on 15/3/2.
//  Copyright (c) 2015年 ZK. All rights reserved.
//

#define NAMEFONT [UIFont systemFontOfSize:14]
#define TEXTFONT [UIFont systemFontOfSize:15]

#import "FrameModel.h"
#import "DataModel.h"

@implementation FrameModel

- (CGSize)sizeWithText:(NSString *)text maxSize:(CGSize)maxSize font:(UIFont *)font
{

    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil].size;
}


-(void)setDataModel:(DataModel *)dataModel
{
    _dataModel = dataModel;
    //子控件之间的间距
    CGFloat padding = 10;
    //头像
    CGFloat iconX = padding;
    CGFloat iconY = padding;
    CGFloat iconW = 30;
    CGFloat iconH = 30;
    _iconF = CGRectMake(iconX, iconY, iconW, iconH);
    //昵称
    CGSize nameSize = [self sizeWithText:self.dataModel.name maxSize:CGSizeMake(MAXFLOAT, MAXFLOAT) font:NAMEFONT];
    CGFloat nameX = padding + CGRectGetMaxX(_iconF);
    CGFloat nameY = padding + (iconH - nameSize.height) * 0.5;
    _nameF = CGRectMake(nameX, nameY, nameSize.width, nameSize.height);
    //会员
    CGFloat vipX =  padding + CGRectGetMaxX(_nameF);
    CGFloat vipY = padding;
    CGFloat vipW = 14;
    CGFloat vipH = 14;
    _vipF = CGRectMake(vipX, vipY, vipW, vipH);
    //内容
    CGFloat textX =  padding;
    CGFloat textY = padding + CGRectGetMaxY(_iconF);
    CGSize textSize = [self sizeWithText:self.dataModel.text maxSize:CGSizeMake([UIScreen mainScreen].bounds.size.width - padding * 2, MAXFLOAT) font:TEXTFONT];
    _textF = CGRectMake(textX, textY, textSize.width, textSize.height);
    //配图
    if (self.dataModel.picture) {
        CGFloat pictureX =  padding;
        CGFloat pictureY = padding + CGRectGetMaxY(_textF);
        CGFloat pictureW = 100;
        CGFloat pictureH = 100;
        _pictureF = CGRectMake(pictureX, pictureY, pictureW, pictureH);
    //cell高度
        _cellHeight = CGRectGetMaxY(_pictureF) + padding;
    }
    else
    {
        _cellHeight = CGRectGetMaxY(_textF) + padding;
    }
}

@end
