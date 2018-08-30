//
//  TextImageCell.m
//  MyLove
//
//  Created by mac on 14/10/28.
//  Copyright (c) 2014年 于建祥. All rights reserved.
//

#import "TextImageCell.h"

@implementation TextImageCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self)
    {
        self.backgroundColor = CLEARCOLOR;
        
        UIView *circle = [[UIView alloc] initWithFrame:CGRectMake(8, 17, 8, 8)];
        circle.backgroundColor = [UIColor whiteColor];
        circle.layer.cornerRadius = 4;
        [self addSubview:circle];
        
        self.backImage = [[UIImageView alloc] initWithFrame:CGRectMake(15, 5, ScreenWidth-25, 100)];
        self.backImage.image = [[UIImage imageNamed:@"textImage_back"] resizableImageWithCapInsets:UIEdgeInsetsMake(25, 100, 25, 100) resizingMode:UIImageResizingModeStretch];
        [self addSubview:self.backImage];
        
        self.baseView = [CreateView createViewWithFrame:CGRectMake(30, 10, ScreenWidth-45, 30) backColor:CLEARCOLOR];
        [self addSubview:self.baseView];
        baseViewWidth = self.baseView.frame.size.width;
        
        self.timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, baseViewWidth, 20)];
        self.timeLabel.font = [MyFont sysFontWithSize:15];
        self.timeLabel.textColor = [UIColor grayColor];
        [self.baseView addSubview:self.timeLabel];
        
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, baseViewWidth, 50)];
        self.titleLabel.font = [MyFont fontWithSize:16];
        self.titleLabel.numberOfLines = 0;
        self.titleLabel.textColor = BLACKCOLOR;
        [self.baseView addSubview:self.titleLabel];
        
        float imageWidth = (baseViewWidth-15)/2.0;
        
        self.pic1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, imageWidth, imageWidth)];
        self.pic1.contentMode = UIViewContentModeScaleAspectFill;
        self.pic1.layer.masksToBounds = YES;
        [self.baseView addSubview:self.pic1];
        
        self.pic2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, imageWidth, imageWidth)];
        self.pic2.contentMode = UIViewContentModeScaleAspectFill;
        self.pic2.layer.masksToBounds = YES;
        [self.baseView addSubview:self.pic2];
        
        self.pic3 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, imageWidth, imageWidth)];
        self.pic3.contentMode = UIViewContentModeScaleAspectFill;
        self.pic3.layer.masksToBounds = YES;
        [self.baseView addSubview:self.pic3];
        
        self.pic4 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, imageWidth, imageWidth)];
        self.pic4.contentMode = UIViewContentModeScaleAspectFill;
        self.pic4.layer.masksToBounds = YES;
        [self.baseView addSubview:self.pic4];
        
        self.more = [[UILabel alloc] init];
        self.more.font = [MyFont sysFontWithSize:15];
        self.more.textColor = RGBACOLOR(7, 131, 221, 1);
        self.more.text = @"更多";
        self.more.hidden = YES;
        [self.baseView addSubview:self.more];
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    float height = [self.content sizeWithFont:[MyFont fontWithSize:16] constrainedToSize:CGSizeMake(baseViewWidth, MAXFLOAT)].height+5;
    self.titleLabel.frame = CGRectMake(0, 20, baseViewWidth, height);
    NSLog(@"hh = %f %@",height,self.content);
    
    float imageWidth = (baseViewWidth-15)/2.0;
    float baseViewHeight = 20+height;
    if (self.pic1.image)
    {
        self.pic1.hidden = NO;
        self.pic1.frame = CGRectMake(5, self.titleLabel.frame.size.height+20+5, imageWidth, imageWidth);
        baseViewHeight += (imageWidth+5);
    }
    else
    {
        self.pic1.hidden = YES;
    }
    
    if (self.pic2.image)
    {
        self.pic2.hidden = NO;
        self.pic2.frame = CGRectMake(5+imageWidth+5, self.titleLabel.frame.size.height+20+5, imageWidth, imageWidth);
    }
    else
    {
        self.pic2.hidden = YES;
    }
    
    if (self.pic3.image)
    {
        self.pic3.hidden = NO;
        self.pic3.frame = CGRectMake(5, self.pic1.frame.origin.y+imageWidth+5, imageWidth, imageWidth);
        baseViewHeight += (imageWidth+5);
    }
    else
    {
        self.pic3.hidden = YES;
    }
    
    if (self.pic4.image)
    {
        self.pic4.hidden = NO;
        self.pic4.frame = CGRectMake(5+imageWidth+5, self.pic2.frame.origin.y+imageWidth+5, imageWidth, imageWidth);
    }
    else
    {
        self.pic4.hidden = YES;
    }
    
    if (!self.more.hidden)
    {
        self.more.frame = CGRectMake(5, self.pic3.frame.origin.y+imageWidth+5, 100, 20);
        baseViewHeight += (20+5);
    }
    
    self.baseView.frame = CGRectMake(30, 10, ScreenWidth-45, baseViewHeight+5);
    self.backImage.frame = CGRectMake(15, 5, ScreenWidth-25, self.baseView.frame.size.height+10);
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
