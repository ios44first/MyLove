//
//  MyDefine.h
//  MyLove
//
//  Created by mac on 14-10-15.
//  Copyright (c) 2014年 于建祥. All rights reserved.
//

#ifndef MyLove_MyDefine_h
#define MyLove_MyDefine_h

//获取代理
#define theAppDelegate ((AppDelegate *)[[UIApplication sharedApplication] delegate])

//判断设备
#define isIPhone6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)

#define isIPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)

#define isIPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

#define isRetina ([[UIScreen mainScreen] scale] > 1)

//判断系统
#define isIOS7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)

#define isIOS8 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)

#define iOS7  ( [[[UIDevice currentDevice] systemVersion] compare:@"7.0"] != NSOrderedAscending )

//获取屏幕长宽
#define ScreenHeight  ([UIScreen mainScreen].bounds.size.height)

#define ScreenWidth  ([UIScreen mainScreen].bounds.size.width)

#define ScreenScale  (([UIScreen mainScreen].bounds.size.width)/320.0)
#define ScreenHeightScale  (([UIScreen mainScreen].bounds.size.height)/480.0)

//色值 颜色
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

#define NavigationColor RGBACOLOR(252, 65, 130, 1)

#define CLEARCOLOR [UIColor clearColor]

#define WHITECOLOR [UIColor whiteColor]

#define BLACKCOLOR [UIColor blackColor]

#define REDCOLOR   [UIColor redColor]

//加载图片
#define CreateImageJpg(name) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:name ofType:@"jpg"]]

#define CreateImagePng(name) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:name ofType:@"png"]]

#endif
