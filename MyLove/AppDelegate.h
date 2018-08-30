//
//  AppDelegate.h
//  MyLove
//
//  Created by mac on 14-10-15.
//  Copyright (c) 2014年 于建祥. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyNavigationController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    UIView *blackView;
}

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UIWindow * menuWindow;

@property (nonatomic,strong) MyNavigationController *naVC1;
@property (nonatomic,strong) MyNavigationController *naVC2;
@property (nonatomic,strong) MyNavigationController *naVC3;
@property (nonatomic,strong) MyNavigationController *naVC4;
@property (nonatomic,strong) MyNavigationController *naVC5;


- (void)installMenuWindow;
- (void)hideSelf;
- (void)showSelf;

@end

