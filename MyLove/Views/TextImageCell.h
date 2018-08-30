//
//  TextImageCell.h
//  MyLove
//
//  Created by mac on 14/10/28.
//  Copyright (c) 2014年 于建祥. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TextImageCell : UITableViewCell
{
    float baseViewWidth;
}
@property (nonatomic,copy) NSString *content;
@property (nonatomic,strong) UIImageView *backImage;
@property (nonatomic,strong) UIView *baseView;
@property (nonatomic,strong) UILabel *timeLabel;
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UIImageView *pic1;
@property (nonatomic,strong) UIImageView *pic2;
@property (nonatomic,strong) UIImageView *pic3;
@property (nonatomic,strong) UIImageView *pic4;
@property (nonatomic,strong) UILabel *more;

@end
