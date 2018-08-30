//
//  MenuViewController.m
//  MyLove
//
//  Created by mac on 14-10-15.
//  Copyright (c) 2014年 于建祥. All rights reserved.
//

#import "MenuViewController.h"

#define MenuViewHeight  (60+(ScreenHeight-480)*0.06)
#define MenuBtnY        ((isIOS7?140:120)+(ScreenHeight-480)*0.08)
#define MenuBtnMargin   (3+(ScreenHeight-480)*0.03)
#define margin          0.15

@interface MenuViewController ()
{
    UIView *menuView1;
    UIView *menuView2;
    UIView *menuView3;
    UIView *menuView4;
    UIView *menuView5;
    
    UIImageView *circel;
}
@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupView];
}

- (void)setupView
{
    self.view.backgroundColor = [UIColor clearColor];
    
    UIImageView *imv = [[UIImageView alloc] initWithFrame:CGRectMake((MenuWidth-250), 0, 250, ScreenHeight)];
    imv.image = [UIImage imageNamed:@"menu_back"];
    [self.view addSubview:imv];
    
//    NSString *html = [NSString stringWithFormat:@"<img src = 'file://%@/love.gif' height='500' width='250'>", [[NSBundle mainBundle] bundlePath]];
//    NSLog(@"path = %@",[[NSBundle mainBundle] pathForResource:@"love" ofType:@"gif"]);
//    UIWebView *myWebView=[[UIWebView alloc]initWithFrame:CGRectMake(0, 0, 250, 125)];
//    [myWebView loadHTMLString: html baseURL:nil];
//    myWebView.userInteractionEnabled=NO;
//    myWebView.backgroundColor = CLEARCOLOR;
//    [self.view addSubview:myWebView];
    
//    UIImageView *loveView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 250, 125)];
//    loveView.backgroundColor = CLEARCOLOR;
//    NSMutableArray *imgArray = [NSMutableArray arrayWithCapacity:3];
//    for (int i=1; i<4; i++)
//    {
//        UIImage *img = [UIImage imageNamed:[NSString stringWithFormat:@"love%d",i]];
//        [imgArray addObject:img];
//    }
//    loveView.animationDuration = 1;
//    loveView.animationImages = imgArray;
//    loveView.animationRepeatCount = -1;
//    [loveView startAnimating];
//    [self.view addSubview:loveView];
    
    CGRect frame = CGRectMake(MenuViewHeight, 0, MenuWidth-MenuViewHeight, MenuViewHeight);
    
    menuView1 = [CreateView createViewWithFrame:CGRectMake(-MenuWidth, MenuBtnY, MenuWidth, MenuViewHeight) backColor:RGBACOLOR(255, 255, 255, 0.2)];
    UILabel *title1 = [CreateView createLabelWithFrame:frame title:@"爱情旅程" fontSize:20 textColor:WHITECOLOR];
    [menuView1 addSubview:title1];
    UIImageView *icon1 = [[UIImageView alloc] initWithFrame:CGRectMake(20, (MenuViewHeight-25)/2.0, 25, 25)];
    icon1.image = [UIImage imageNamed:@"loveStory"];
    [menuView1 addSubview:icon1];
    [self.view addSubview:menuView1];
    [self createControlWithFrame:CGRectMake(0, MenuBtnY, MenuWidth, MenuViewHeight) withTag:1];
    
    menuView2 = [CreateView createViewWithFrame:CGRectMake(-MenuWidth, MenuBtnY+MenuViewHeight+MenuBtnMargin, MenuWidth, MenuViewHeight) backColor:RGBACOLOR(255, 255, 255, 0.2)];
    UILabel *title2 = [CreateView createLabelWithFrame:frame title:@"我们的足迹" fontSize:20 textColor:WHITECOLOR];
    [menuView2 addSubview:title2];
    UIImageView *icon2 = [[UIImageView alloc] initWithFrame:CGRectMake(20, (MenuViewHeight-25)/2.0, 25, 25)];
    icon2.image = [UIImage imageNamed:@"lovemap"];
    [menuView2 addSubview:icon2];
    [self.view addSubview:menuView2];
    [self createControlWithFrame:CGRectMake(0, MenuBtnY+MenuViewHeight+MenuBtnMargin, MenuWidth, MenuViewHeight) withTag:2];
    
    menuView3 = [CreateView createViewWithFrame:CGRectMake(-MenuWidth, MenuBtnY+(MenuViewHeight+MenuBtnMargin)*2, MenuWidth, MenuViewHeight) backColor:RGBACOLOR(255, 255, 255, 0.2)];
    UILabel *title3 = [CreateView createLabelWithFrame:frame title:@"我们的婚纱照" fontSize:20 textColor:WHITECOLOR];
    [menuView3 addSubview:title3];
    UIImageView *icon3 = [[UIImageView alloc] initWithFrame:CGRectMake(20, (MenuViewHeight-25)/2.0, 25, 25)];
    icon3.image = [UIImage imageNamed:@"loveImage"];
    [menuView3 addSubview:icon3];
    [self.view addSubview:menuView3];
    [self createControlWithFrame:CGRectMake(0, MenuBtnY+(MenuViewHeight+MenuBtnMargin)*2, MenuWidth, MenuViewHeight) withTag:3];
    
    menuView4 = [CreateView createViewWithFrame:CGRectMake(-MenuWidth, MenuBtnY+(MenuViewHeight+MenuBtnMargin)*3, MenuWidth, MenuViewHeight) backColor:RGBACOLOR(255, 255, 255, 0.2)];
    UILabel *title4 = [CreateView createLabelWithFrame:frame title:@"我的情书" fontSize:20 textColor:WHITECOLOR];
    [menuView4 addSubview:title4];
    UIImageView *icon4 = [[UIImageView alloc] initWithFrame:CGRectMake(20, (MenuViewHeight-25)/2.0, 25, 25)];
    icon4.image = [UIImage imageNamed:@"lovemessage"];
    [menuView4 addSubview:icon4];
    [self.view addSubview:menuView4];
    [self createControlWithFrame:CGRectMake(0, MenuBtnY+(MenuViewHeight+MenuBtnMargin)*3, MenuWidth, MenuViewHeight) withTag:4];
    
    menuView5 = [CreateView createViewWithFrame:CGRectMake(-MenuWidth, MenuBtnY+(MenuViewHeight+MenuBtnMargin)*4, MenuWidth, MenuViewHeight) backColor:RGBACOLOR(255, 255, 255, 0.2)];
    UILabel *title5 = [CreateView createLabelWithFrame:frame title:@"关 于" fontSize:20 textColor:WHITECOLOR];
    [menuView5 addSubview:title5];
    UIImageView *icon5 = [[UIImageView alloc] initWithFrame:CGRectMake(20, (MenuViewHeight-25)/2.0, 25, 25)];
    icon5.image = [UIImage imageNamed:@"loveabout"];
    [menuView5 addSubview:icon5];
    [self.view addSubview:menuView5];
    [self createControlWithFrame:CGRectMake(0, MenuBtnY+(MenuViewHeight+MenuBtnMargin)*4, MenuWidth, MenuViewHeight) withTag:5];
    
    circel = [[UIImageView alloc] initWithFrame:CGRectMake((MenuWidth-100)/2.0, MenuBtnY-20-95, 100, 100)];
    circel.image = [UIImage imageNamed:@"circle"];
    [self.view addSubview:circel];
    [self startAnimation];
    
//    CABasicAnimation* rotationAnimation;
//    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
//    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 ];
//    rotationAnimation.duration = duration;
//    rotationAnimation.cumulative = YES;
//    rotationAnimation.repeatCount = repeat;
//    
//    [_loadingView.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];

    
    UIImageView *headView = [[UIImageView alloc] initWithFrame:CGRectMake((MenuWidth-90)/2.0, MenuBtnY-20-90, 90, 90)];
    headView.image = [UIImage imageNamed:@"Icon@2x"];
    headView.layer.cornerRadius = 45;
    headView.layer.masksToBounds = YES;
    [self.view addSubview:headView];
}

- (void)startAnimation
{
    static float angle = 0;
    CGAffineTransform endAngle = CGAffineTransformMakeRotation(angle * (M_PI / 180.0f));
    
    [UIView animateWithDuration:0.06 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        circel.transform = endAngle;
    } completion:^(BOOL finished) {
        angle += 10; [self startAnimation];
    }];
    
}
//
//-(void) startAnimation
//{
//    [UIView beginAnimations:nil context:nil];
//    [UIView setAnimationDuration:0.01];
//    [UIView setAnimationDelegate:self];
//    [UIView setAnimationDidStopSelector:@selector(endAnimation)];
//    imageView.transform = CGAffineTransformMakeRotation(angle * (M_PI / 180.0f));
//    [UIView commitAnimations];
//}
//
//-(void)endAnimation
//{
//    angle += 10;
//    [self startAnimation];
//}

- (void)createControlWithFrame:(CGRect)frame withTag:(int)tag
{
    UIControl *con = [[UIControl alloc] initWithFrame:frame];
    con.backgroundColor = CLEARCOLOR;
    con.tag = tag;
    [con addTarget:self action:@selector(gotoNext:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:con];
}

- (void)gotoNext:(UIControl *)con
{
    AppDelegate *appD = [self getAppDelegate];
    [appD hideSelf];
    
    switch (con.tag)
    {
        case 1:
        {
            if (!appD.naVC1)
            {
                appD.naVC1 = [[MyNavigationController alloc] initWithRootViewController:[MainViewController new]];
            }
            appD.window.rootViewController = appD.naVC1;
        }
            break;
            
        case 2:
        {
            if (!appD.naVC2)
            {
                LoveMapViewController *map = [LoveMapViewController new];
                appD.naVC2 = [[MyNavigationController alloc] initWithRootViewController:map];
            }
            appD.window.rootViewController = appD.naVC2;
        }
            break;
        case 3:
        {
            if (!appD.naVC3)
            {
                PictureViewController *picture = [PictureViewController new];
                appD.naVC3 = [[MyNavigationController alloc] initWithRootViewController:picture];
            }
            appD.window.rootViewController = appD.naVC3;
        }
            break;
            
        case 4:
        {
            if (!appD.naVC4)
            {
                MovieViewController *movie = [MovieViewController new];
                appD.naVC4 = [[MyNavigationController alloc] initWithRootViewController:movie];
            }
            appD.window.rootViewController = appD.naVC4;
        }
            break;
            
        case 5:
        {
            if (!appD.naVC5)
            {
                appD.naVC5 = [[MyNavigationController alloc] initWithRootViewController:[AboutViewController new]];
            }
            appD.window.rootViewController = appD.naVC5;
        }
            break;
            
        default:
            break;
    }
}

- (AppDelegate *)getAppDelegate
{
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}

- (void)showButton
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self performSelector:@selector(moveView:) withObject:menuView1 afterDelay:0.2];
        [self performSelector:@selector(moveView:) withObject:menuView2 afterDelay:0.2+margin*1];
        [self performSelector:@selector(moveView:) withObject:menuView3 afterDelay:0.2+margin*2];
        [self performSelector:@selector(moveView:) withObject:menuView4 afterDelay:0.2+margin*3];
        [self performSelector:@selector(moveView:) withObject:menuView5 afterDelay:0.2+margin*4];
    });
}

- (void)moveView:(UIView *)view
{
    CGRect frame = view.frame;
    [UIView animateWithDuration:margin*2 animations:^{
        view.frame = CGRectMake(0, frame.origin.y, frame.size.width, frame.size.height);
    }];
}

- (void)hideButton
{
    [self hideView:menuView1];
    [self hideView:menuView2];
    [self hideView:menuView3];
    [self hideView:menuView4];
    [self hideView:menuView5];
}

- (void)hideView:(UIView *)view
{
    CGRect frame = view.frame;
    view.frame = CGRectMake(-MenuWidth, frame.origin.y, frame.size.width, frame.size.height);
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.view.frame = CGRectMake(-MenuWidth, 0, MenuWidth, ScreenHeight);
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
