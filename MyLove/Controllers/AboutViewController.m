//
//  AboutViewController.m
//  MyLove
//
//  Created by mac on 14/10/19.
//  Copyright (c) 2014年 于建祥. All rights reserved.
//

#import "AboutViewController.h"

@interface AboutViewController ()
{
    UIScrollView *scroll;
}
@end

@implementation AboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
}

- (void)setupView
{
    [self setNavigationItemTitle:@"关 于"];
    
    UIImageView *backView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight-64)];
    //backView.image = [UIImage imageNamed:@"picture_back"];
    backView.backgroundColor = RGBACOLOR(252, 65, 130, 0.2);
    [self.view addSubview:backView];
    
    scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight-64)];
    scroll.backgroundColor = CLEARCOLOR;
    [self.view addSubview:scroll];
    
    UIImageView *logo = [[UIImageView alloc] initWithFrame:CGRectMake((ScreenWidth-100)/2.0, 30, 100, 100)];
    logo.image = [UIImage imageNamed:@"Icon@2x.png"];
    logo.layer.cornerRadius = 5;
    logo.layer.masksToBounds = YES;
    [scroll addSubview:logo];
    
    NSString *descriptionString = @"        在业余时间慢慢完成此App，目的为了纪念我们的恋爱之路，也是给老婆的结婚礼物。从设计、素材、ps作图到程序代码都是独立完成，其中搜索素材和作图占了一半的时间。";
    
    UILabel *description = [CreateView createLabelWithFrame:CGRectMake(30, logo.frame.origin.y+logo.frame.size.height+30, ScreenWidth-60, [descriptionString heightOfStringWithWidth:ScreenWidth-60 font:[MyFont sysFontWithSize:16]]+10) title:descriptionString fontSize:18 textColor:RGBACOLOR(255, 60, 120, 1)];
    description.font = [MyFont sysFontWithSize:16];
    description.numberOfLines = 0;
    [scroll addSubview:description];
    
    //NSString *contentString = @"2014.10.15\n初步构思，创建项目，粉红色调主题；\n搭建框架（抽屉菜单），添加背景水纹特效；\n\n2014.10.16\n搜索第三方字体库，最终确定Kitty字体；\n初步设定Logo和启动图，菜单选项；\n\n2014.10.17\n增加登陆页，账号密码固定的；\n\n2014.10.19\n实现菜单的点击事件，增加导航栏和字符串处理；\n\n2014.10.20\n“我们的足迹”添加地图；\n“爱情旅程”列表框架；\nBase控制器底部全局按钮放到了导航上；\n\n\n版权所有，违版必究；\nyujianxiang999@163.com\nhttp://blog.csdn.net/yujianxiang666";
    NSString *contentString = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"aboutText" ofType:@"txt"] encoding:NSUTF8StringEncoding error:nil];
    
    UILabel *content = [CreateView createLabelWithFrame:CGRectMake(30, description.frame.origin.y+description.frame.size.height+20, ScreenWidth-60, [contentString heightOfStringWithWidth:ScreenWidth-60 font:[UIFont systemFontOfSize:15]]+10) title:contentString fontSize:15 textColor:RGBACOLOR(252, 65, 130, 1)];
    content.font = [UIFont systemFontOfSize:15];
    content.numberOfLines = 0;
    [scroll addSubview:content];
    scroll.contentSize = CGSizeMake(ScreenWidth, content.frame.origin.y+content.frame.size.height+30);
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
