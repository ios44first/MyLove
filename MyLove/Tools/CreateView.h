//
//  CreateView.h
//  MyLove
//
//  Created by mac on 14-10-15.
//  Copyright (c) 2014年 于建祥. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

extern UIImage * ImageWithName(NSString *imageName);

extern UIImage * ImageWithJPGName(NSString *imageName);


@interface CreateView : NSObject

//button
+ (UIButton *)createButtonWithFrame:(CGRect)frame title:(NSString *)titleString backImage:(UIImage *)image Target:(id)target selector:(SEL)selector;
+ (UIButton *)createButtonWithFrame:(CGRect)frame title:(NSString *)titleString backColor:(UIColor *)color Target:(id)target selector:(SEL)selector;
+ (UIButton *)createButtonWithFrame:(CGRect)frame title:(NSString *)titleString type:(UIButtonType)bType Target:(id)target selector:(SEL)selector;

//label
+ (UILabel *)createLabelWithFrame:(CGRect)frame title:(NSString *)titleString fontSize:(float)number  textColor:(UIColor *)color;
+ (UILabel *)createLabelWithFrame:(CGRect)frame title:(NSString *)titleString fontSize:(float)number textAlignment:(NSTextAlignment)alignment;
+ (UILabel *)createLabelWithFrame:(CGRect)frame title:(NSString *)titleString fontSize:(float)number backColor:(UIColor *)bcolor textColor:(UIColor *)tcolor textAlignment:(NSTextAlignment)alignment;

//view
+ (UIView *)createViewWithFrame:(CGRect)frame backColor:(UIColor *)color;

@end
