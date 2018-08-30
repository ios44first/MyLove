//
//  ViewController-ForNavgationItemViewController.m
//  MyLove
//
//  Created by mac on 14/10/17.
//  Copyright (c) 2014年 于建祥. All rights reserved.
//

#import "UIViewController-ForNavgationItemViewController.h"


@implementation UIViewController (ForNavgationItemViewController)

//设置navgation bar title
- (void)setNavigationItemTitle:(NSString *)aTitle
{
    self.navigationItem.title = nil;
    
    float width_ = [aTitle widthOfStringWithHeight:30 font:[MyFont fontWithSize:20]];
    CGRect frame_ = CGRectMake(0, 0, width_, 30);
    
    UILabel *label_ = [[UILabel alloc] initWithFrame:frame_];
    label_.text = aTitle;
    label_.font = [MyFont fontWithSize:20];
    label_.textColor = [UIColor whiteColor];
    label_.backgroundColor = [UIColor clearColor];
    label_.textAlignment = NSTextAlignmentCenter;
    
    self.navigationItem.titleView = label_;
}

//设置navigationItem rightItem 图片
- (void)rightItemWithImage:(NSString *)imageName
                 andAction:(SEL)action
{
    self.navigationItem.rightBarButtonItem = nil;
    
    UIButton *button_ = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 25, 25)];
    [button_ setBackgroundImage:ImageWithName(imageName) forState:(UIControlStateNormal)];
    //[button_ setBackgroundImage:ImageWithName(imageName) forState:(UIControlStateHighlighted)];
    [button_ addTarget:self action:action forControlEvents:(UIControlEventTouchUpInside)];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button_];
}

//设置navigationItem rightItem 标题
- (void)rightItemWithTitle:(NSString *)titleName
                 andAction:(SEL)action
{
    UIButton *button_ = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 40)];
    button_.backgroundColor = CLEARCOLOR;
    [button_ setTitle:titleName forState:(UIControlStateNormal)];
    [button_ addTarget:self action:action forControlEvents:(UIControlEventTouchUpInside)];
    [button_ setTitleColor:RGBACOLOR(250, 190, 55,1) forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button_];
}

//设置navigationItem leftItem
- (void)leftItemWithImage:(NSString *)imageName
                andAction:(SEL)action
{
    UIButton *button_ = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 25, 25)];
    [button_ setBackgroundImage:ImageWithName(imageName) forState:(UIControlStateNormal)];
    //[button_ setBackgroundImage:ImageWithName(imageName) forState:(UIControlStateHighlighted)];
    [button_ addTarget:self action:action forControlEvents:(UIControlEventTouchUpInside)];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button_];
}

//设置navigationItem rightItem 标题
- (void)leftItemWithTitle:(NSString *)titleName
                andAction:(SEL)action
{
    UIButton *button_ = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 40)];
    [button_ setTitle:titleName forState:(UIControlStateNormal)];
    [button_ addTarget:self action:action forControlEvents:(UIControlEventTouchUpInside)];
    [button_ setTitleColor:RGBACOLOR(250, 190, 55,1) forState:UIControlStateNormal];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button_];
}

//设置backButton
- (void)addBackButton
{
    [self leftItemWithImage:@"back" andAction:@selector(backToPrevious)];
}

- (void)backToPrevious
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
