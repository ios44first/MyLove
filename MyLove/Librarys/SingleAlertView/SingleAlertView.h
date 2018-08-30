//
//  SingleAlertView.h
//  SOHUAssistant
//
//  Created by uway_soft on 13-10-13.
//  Copyright (c) 2013年 uway_soft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RichLabel.h"

//单纯提示，然后消失

@interface SingleAlertView : UIImageView

@property (strong,nonatomic)RichLabel *contentLabel;

- (id)initWithFrame:(CGRect)frame Text:(NSString *)content;
- (id)initWithFrameTwo:(CGRect)frame Text:(NSString *)content;
- (void)show;
- (void)showtwo;
- (void)hide;

@end
