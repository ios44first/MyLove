//
//  RichLabel.h
//  SOHUAssistant
//
//  Created by wyy on 13-11-18.
//  Copyright (c) 2013年 uway_soft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RichLabel : UILabel{
    CGFloat charSpace_;
    CGFloat lineSpace_;
   
}
@property(nonatomic, assign) CGFloat charSpace;
@property(nonatomic, assign) CGFloat lineSpace;
@property(nonatomic, assign) NSString*fontname;
@property(nonatomic,assign) UIFont*myfont;
@property(nonatomic,assign)CTLineBreakMode mode;
@property(nonatomic,assign)BOOL isSetStyle;
@property(nonatomic,strong) NSMutableAttributedString *string;
-(void)setText:(NSString *)text WithFont:(UIFont *)font AndColor:(UIColor *)color;
-(void)setKeyWordTextString:(NSString *)keyWordArray WithFont:(UIFont *)font AndColor:(UIColor *)keyWordColor;
- (CGFloat)boundingHeightForWidth:(CGFloat)inWidth;
-(void)setRichLinebreakMode:(CTLineBreakMode)breakmode;

@end


typedef enum
{
    VerticalAlignmentTop = 0, // default
    VerticalAlignmentMiddle,
    VerticalAlignmentBottom,
} VerticalAlignment;


@interface myUILabel : UILabel
{
@private
    VerticalAlignment _verticalAlignment;
}

@property (nonatomic) VerticalAlignment verticalAlignment;

@end