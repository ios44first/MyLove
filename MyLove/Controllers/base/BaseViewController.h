//
//  BaseViewController.h
//  MyLove
//
//  Created by mac on 14-10-15.
//  Copyright (c) 2014年 于建祥. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "SingleAlertView.h"

@interface BaseViewController : UIViewController
{
//    UIButton *menu;
//    UIButton *music;
}

@property (nonatomic,strong)SingleAlertView *mySingleAlertView;

-(void)showSingleAlertWith:(NSString *)alertText;

- (void)showMenu;
- (void)hideMenu;

- (void)addSwipeGesture;

- (void)goBkack;

- (AppDelegate *)getAppDelegate;

@end
