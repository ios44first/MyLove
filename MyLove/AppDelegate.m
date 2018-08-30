//
//  AppDelegate.m
//  MyLove
//
//  Created by mac on 14-10-15.
//  Copyright (c) 2014年 于建祥. All rights reserved.
//

#import "AppDelegate.h"
#import "LoginViewController.h"
#import "MenuViewController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    [[UIApplication sharedApplication] setStatusBarStyle: UIStatusBarStyleDefault];
    
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor blackColor];
    
    self.window.rootViewController = [LoginViewController new];
    
    [self.window makeKeyAndVisible];
    
    
    [self installMenuWindow];
    
    [MusicManager play];
    
    return YES;
}

- (void)installMenuWindow
{
    self.menuWindow = [[UIWindow alloc] initWithFrame:CGRectMake(-ScreenWidth, 0, ScreenWidth, ScreenHeight)];
    self.menuWindow.hidden = NO;
    self.menuWindow.backgroundColor = [UIColor clearColor];
    
    blackView = [[UIView alloc] initWithFrame:self.menuWindow.bounds];
    blackView.backgroundColor = CLEARCOLOR;
    [self.menuWindow addSubview:blackView];
    
    UIControl *control = [[UIControl alloc] initWithFrame:self.menuWindow.bounds];
    [control addTarget:self action:@selector(hideSelf) forControlEvents:UIControlEventTouchUpInside];
    [self.menuWindow addSubview:control];
    
    self.menuWindow.rootViewController = [MenuViewController new];
    self.menuWindow.rootViewController.view.frame = CGRectMake(-MenuWidth, 0, MenuWidth, ScreenHeight);
    blackView.backgroundColor = CLEARCOLOR;
}

- (void)hideSelf
{
    [UIView animateWithDuration:0.5 animations:^{
        self.menuWindow.rootViewController.view.frame = CGRectMake(-MenuWidth, 0, MenuWidth, ScreenHeight);
        blackView.backgroundColor = CLEARCOLOR;
    } completion:^(BOOL finished) {
        self.menuWindow.frame = CGRectMake(-ScreenWidth, 0, ScreenWidth, ScreenHeight);
        MenuViewController *menu = (MenuViewController *)self.menuWindow.rootViewController;
        [menu hideButton];
    }];
}

- (void)showSelf
{
    self.menuWindow.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
    [UIView animateWithDuration:0.5 animations:^{
        self.menuWindow.rootViewController.view.frame = CGRectMake(0, 0, MenuWidth, ScreenHeight);
        blackView.backgroundColor = RGBACOLOR(0, 0, 0, 0.5);
    }];
    MenuViewController *menu = (MenuViewController *)self.menuWindow.rootViewController;
    [menu showButton];
}

- (void)applicationWillResignActive:(UIApplication *)application
{
//    if (self.naVC4)
//    {
//        if ([self.window.rootViewController isEqual:self.naVC4])
//        {
//            self.window.rootViewController = nil;
//        }
//        self.naVC4 = nil;
//    }
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
//    if (self.naVC4)
//    {
//        if ([self.window.rootViewController isEqual:self.naVC4])
//        {
//            self.window.rootViewController = nil;
//        }
//        self.naVC4 = nil;
//    }
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
//    if (!self.window.rootViewController)
//    {
//        if (!self.naVC4)
//        {
//            MovieViewController *movie = [MovieViewController new];
//            self.naVC4 = [[MyNavigationController alloc] initWithRootViewController:movie];
//        }
//        self.window.rootViewController = self.naVC4;
//    }
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
