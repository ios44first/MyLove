//
//  BaseViewController.m
//  MyLove
//
//  Created by mac on 14-10-15.
//  Copyright (c) 2014年 于建祥. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initSubViews];
    
    [self addSwipeGesture];
    
    [self addObserver];
}

- (void)addObserver
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(checkMusic) name:@"CheckMusic" object:nil];
}

- (void)checkMusic
{
    if ([MusicManager getPlayer].player.isPlaying)
    {
        [self rightItemWithImage:@"stop" andAction:@selector(playMusic:)];
    }
    else
    {
        [self rightItemWithImage:@"play" andAction:@selector(playMusic:)];
    }
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self checkMusic];
}

- (void)initSubViews
{
    self.navigationController.navigationBar.translucent = NO;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self leftItemWithImage:@"show_menu" andAction:@selector(showMenu)];
   // [self rightItemWithImage:@"stop" andAction:@selector(playMusic:)];
    
    //让这个Controller本身支持摇动
    [[UIApplication sharedApplication] setApplicationSupportsShakeToEdit:YES];
    //同时让他成为第一相应者
    [self becomeFirstResponder];
    
//    menu = [CreateView createButtonWithFrame:CGRectMake(10, ScreenHeight-10-40-65, 40, 40) title:@"" backImage:[UIImage imageNamed:@"show_menu"] Target:self selector:@selector(showMenu)];
//    [self.view addSubview:menu];
//    
//    music = [CreateView createButtonWithFrame:CGRectMake(ScreenWidth-40-10, ScreenHeight-10-40-65, 40, 40) title:@"" backImage:[UIImage imageNamed:@"stop"] Target:self selector:@selector(playMusic:)];
//    [self.view addSubview:music];
}

#pragma mark  -  检测摇动的方法
-(void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    NSLog(@"检测到摇动");
}

-(void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    NSLog(@"摇动结束");
    if (event.subtype == UIEventSubtypeMotionShake)
    {
        [MusicManager nextPlay];
        [self checkMusic];
    }
}

-(void)motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    NSLog(@"摇动取消");
}

#pragma mark - 按钮方法
- (void)playMusic:(UIButton *)sender
{
    static BOOL isplay = YES;
    if (isplay)
    {
        [sender setBackgroundImage:[UIImage imageNamed:@"play"] forState:UIControlStateNormal];
        isplay = NO;
        [MusicManager pause];
    }
    else
    {
        [sender setBackgroundImage:[UIImage imageNamed:@"stop"] forState:UIControlStateNormal];
        isplay = YES;
        [MusicManager play];
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"CheckMusic" object:nil];
}

- (void)goBkack
{
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark - 手势 菜单
- (void)addSwipeGesture
{
    UISwipeGestureRecognizer *swip = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(showMenu)];
    swip.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swip];
}

- (AppDelegate *)getAppDelegate
{
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}

- (void)showMenu
{
    [[self getAppDelegate] showSelf];
}

- (void)hideMenu
{
    [[self getAppDelegate] hideSelf];
}


-(void)showSingleAlertWith:(NSString *)alertText
{
    
    if (!alertText) {
        return;
    }
    //用户名或密码错误
    SingleAlertView *salert = [[SingleAlertView alloc]initWithFrame:CGRectMake((ScreenWidth-170)/2.0, [UIScreen mainScreen].bounds.size.height/2-110.0, 170, 80) Text:alertText];
    _mySingleAlertView = salert;
    [self.view addSubview:_mySingleAlertView];
    [_mySingleAlertView show];
    
    double delayInSeconds = 1.5;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        _mySingleAlertView = nil;
        
    });
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
