//
//  LoginViewController.m
//  MyLove
//
//  Created by mac on 14-10-17.
//  Copyright (c) 2014年 于建祥. All rights reserved.
//

#import "LoginViewController.h"
#import "MainViewController.h"

#define ViewY  200*ScreenHeightScale

@interface LoginViewController ()
{
    UITextField *nameInput;
    UITextField *passInput;
    UIProgressView *progerss;
}
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupView];
}

- (void)setupView
{
    UIImageView *backImage = [[UIImageView alloc] initWithFrame:self.view.bounds];
    backImage.image = [UIImage imageNamed:@"login_back"];
    [self.view addSubview:backImage];
    
    
    UILabel *name = [CreateView createLabelWithFrame:CGRectMake(40, ViewY-5, 100, 30) title:@"用户名" fontSize:20 textColor:REDCOLOR];
    [self.view addSubview:name];
    
    nameInput = [[UITextField alloc] initWithFrame:CGRectMake(110, ViewY-5, ScreenWidth-90-60, 30)];
    nameInput.borderStyle = UITextBorderStyleRoundedRect;
    nameInput.text = @"于建祥💗杨淑娟";
    nameInput.userInteractionEnabled = NO;
    [self.view addSubview:nameInput];
    
    
    UILabel *password = [CreateView createLabelWithFrame:CGRectMake(40, ViewY+45, 100, 30) title:@"密    码" fontSize:20 textColor:REDCOLOR];
    [self.view addSubview:password];
    
    passInput = [[UITextField alloc] initWithFrame:CGRectMake(110, ViewY+45, ScreenWidth-90-60, 30)];
    passInput.borderStyle = UITextBorderStyleRoundedRect;
    passInput.text = @"5201314";
    [self.view addSubview:passInput];
    
    UIButton *login = [CreateView createButtonWithFrame:CGRectMake((ScreenWidth-200)/2.0, passInput.frame.origin.y+passInput.frame.size.height+20*ScreenHeightScale, 200, 78) title:@"进 入" backImage:[UIImage imageNamed:@"heartBtn"] Target:self selector:@selector(gotoLogin:)];
    login.titleLabel.font = [MyFont fontWithSize:20];
    login.titleLabel.textColor = WHITECOLOR;
    login.titleEdgeInsets = UIEdgeInsetsMake(0, 8, 0, 0);
    [self.view addSubview:login];
    
    progerss = [[UIProgressView alloc] initWithFrame:CGRectMake(20, ScreenHeight-60, ScreenWidth-40, 10)];
    progerss.progressTintColor = REDCOLOR;
    progerss.trackTintColor = [UIColor yellowColor];
    progerss.progress = 0;
    progerss.hidden = YES;
    [self.view addSubview:progerss];
    
    UILabel *version = [CreateView createLabelWithFrame:CGRectMake(0, ScreenHeight-40, ScreenWidth, 40) title:@"version 1.0\nCopyRight©2014 于建祥" fontSize:15 textAlignment:NSTextAlignmentCenter];
    version.numberOfLines = 0;
    version.textColor = REDCOLOR;
    version.backgroundColor = RGBACOLOR(255, 255, 255, 0.5);
    [self.view addSubview:version];
    
}

- (void)gotoLogin:(UIButton *)sender
{
    if ([nameInput.text isEqualToString:@"于建祥💗杨淑娟"] && [passInput.text isEqualToString:@"5201314"])
    {
        progerss.hidden = NO;
        [NSTimer scheduledTimerWithTimeInterval:0.02 target:self selector:@selector(updateProgress:) userInfo:nil repeats:YES];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"温馨提示" message:@"密码输入错误！\n密码为：5201314" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alert show];
    }
}

- (void)updateProgress:(NSTimer *)timer
{
    progerss.progress += 0.02;
    if (progerss.progress >= 1)
    {
        [timer invalidate];
        timer = nil;
        MainViewController *mainView = [MainViewController new];
        [self getAppDelegate].naVC1 = [[MyNavigationController alloc] initWithRootViewController:mainView];
        [self getAppDelegate].naVC1.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
        [self presentViewController:[self getAppDelegate].naVC1 animated:YES completion:nil];
    }
}

- (AppDelegate *)getAppDelegate
{
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [nameInput resignFirstResponder];
    [passInput resignFirstResponder];
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
