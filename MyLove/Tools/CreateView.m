//
//  CreateView.m
//  MyLove
//
//  Created by mac on 14-10-15.
//  Copyright (c) 2014年 于建祥. All rights reserved.
//

#import "CreateView.h"

UIImage * ImageWithName(NSString *imageName)
{
    if (isIPhone5) {
        NSString *path = [[NSBundle mainBundle] pathForResource:[imageName stringByAppendingString:@"-568"]
                                                         ofType:@"png"];
        if (path) {
            
            imageName = [imageName stringByAppendingString:@"-568"];
        }
    }
    UIImage *image = [UIImage imageNamed:imageName];
    
    return image;
}

UIImage * ImageWithJPGName(NSString *imageName)
{
    if (isIPhone5) {
        NSString *path = [[NSBundle mainBundle] pathForResource:[imageName stringByAppendingString:@"-568"]
                                                         ofType:@"jpg"];
        if (path) {
            
            imageName = [imageName stringByAppendingString:@"-568.jpg"];
        }
    }
    UIImage *image = [UIImage imageNamed:[imageName stringByAppendingString:@".jpg"]];
    
    return image;
}

@implementation CreateView

#pragma mark - button
+ (UIButton *)createButtonWithFrame:(CGRect)frame title:(NSString *)titleString backImage:(UIImage *)image Target:(id)target selector:(SEL)selector
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = frame;
    [btn setTitle:titleString forState:UIControlStateNormal];
    [btn setBackgroundImage:image forState:UIControlStateNormal];
    [btn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    return btn;
}

+ (UIButton *)createButtonWithFrame:(CGRect)frame title:(NSString *)titleString backColor:(UIColor *)color Target:(id)target selector:(SEL)selector
{
    UIButton *btn = [CreateView createButtonWithFrame:frame title:titleString backImage:nil Target:target selector:selector];
    [btn setBackgroundColor:color];
    return btn;
}

+ (UIButton *)createButtonWithFrame:(CGRect)frame title:(NSString *)titleString type:(UIButtonType)bType Target:(id)target selector:(SEL)selector
{
    UIButton *btn = [UIButton buttonWithType:bType];
    btn.frame = frame;
    [btn setTitle:titleString forState:UIControlStateNormal];
    [btn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    return btn;
}

#pragma mark - label
+ (UILabel *)createLabelWithFrame:(CGRect)frame title:(NSString *)titleString fontSize:(float)number textColor:(UIColor *)color
{
    UILabel *lab = [[UILabel alloc] initWithFrame:frame];
    lab.text = titleString;
    lab.font = [MyFont fontWithSize:number];
    lab.backgroundColor = CLEARCOLOR;
    lab.textColor = color;
    return lab;
}

+ (UILabel *)createLabelWithFrame:(CGRect)frame title:(NSString *)titleString fontSize:(float)number textAlignment:(NSTextAlignment)alignment
{
    UILabel *lab = [[UILabel alloc] initWithFrame:frame];
    lab.text = titleString;
    lab.font = [MyFont sysFontWithSize:number];
    lab.textAlignment = alignment;
    return lab;
}

+ (UILabel *)createLabelWithFrame:(CGRect)frame title:(NSString *)titleString fontSize:(float)number backColor:(UIColor *)bcolor textColor:(UIColor *)tcolor textAlignment:(NSTextAlignment)alignment
{
    UILabel *lab = [CreateView createLabelWithFrame:frame title:titleString fontSize:number textAlignment:alignment];
    lab.textColor = tcolor;
    lab.backgroundColor = bcolor;
    return lab;
}

#pragma mark - view
+ (UIView *)createViewWithFrame:(CGRect)frame backColor:(UIColor *)color
{
    UIView *view = [[UIView alloc] initWithFrame:frame];
    view.backgroundColor = color;
    return view;
}

@end
