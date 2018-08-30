//
//  ViewController-ForNavgationItemViewController.h
//  MyLove
//
//  Created by mac on 14/10/17.
//  Copyright (c) 2014年 于建祥. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (ForNavgationItemViewController)

//设置navigationItem titleView
- (void)setNavigationItemTitle:(NSString *)title;

//设置navigationItem rightItem 图片
- (void)rightItemWithImage:(NSString *)imageName
                 andAction:(SEL)action;

//设置navigationItem rightItem 标题
- (void)rightItemWithTitle:(NSString *)titleName
                 andAction:(SEL)action;

//设置navigationItem leftItem
- (void)leftItemWithImage:(NSString *)imageName
                andAction:(SEL)action;
- (void)leftItemWithTitle:(NSString *)titleName
                andAction:(SEL)action;

//设置backButton
- (void)addBackButton;

@end
