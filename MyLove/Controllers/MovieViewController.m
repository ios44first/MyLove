//
//  MovieViewController.m
//  MyLove
//
//  Created by mac on 14/10/19.
//  Copyright (c) 2014年 于建祥. All rights reserved.
//

#import "MovieViewController.h"

@interface MovieViewController ()
{
    RippleTableViewController *glip;
    
    UIButton *btnL;
    UIButton *btnR;
    UIImageView *redHeart;
    
    UITextView *textViewL;
    UITextView *textViewR;
}
@end

@implementation MovieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(hideView)
                                                 name:UIApplicationWillResignActiveNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(addView)
                                                 name:UIApplicationWillEnterForegroundNotification object:nil];
    [self setupView];
}

- (void)setupView
{
    [self setNavigationItemTitle:@"我的情书"];
    
    //水纹背景
    glip = [RippleTableViewController new];
    glip.rippleImageName = @"main_back";
    [self.view insertSubview:glip.view atIndex:0];
    
    //情书内容
    NSString *stringL = @"有人说时间和距离会淡化感情；\n但是在我们看来它就是爱的保鲜剂；\n距离让我们保持着对对方的幻想；\n虽然它会加剧思念，但我相信这就是柏拉图式的爱恋；\n\n你说你喜欢淅淅沥沥的小雨；\n因为那像你名字一样美；\n你说你崇拜你的偶像；\n因为你听到他的歌会感动得流泪；\n\n所以我常常在呆呆的看着细线的雨滴，听着淅淅沥沥的雨声；\n因为此刻的你也许也在想听雨的我吧；\n我也经常会痴迷于你的偶像；\n因为在那歌声中可以寻觅你情感；\n\n每天问候的短信书写着我们的爱恋；\n手机和qq见证着我们的脚步；\n网络里传递着我们的思念；\n晴空的夜晚望着明月，期盼月光可以折射到你的脸；\n\n我们抛开了物质和金钱的干扰；\n我们面对闲言碎语没有退缩；\n反对和争议抨击着我们的情感；\n但是，我们依然坚定着当初的信念和誓言！\n\n两年半，思念、牵挂、摩擦、分分合合与我们相伴；\n此刻，我们同时迈出了爱情的第一步；\n经过三年的牵挂，两颗心才聚在一起；\n经过风雨波折，我们更加坚定自己的信念；\n\n思念让我们更加珍惜在一起的分分秒秒；\n距离使我们更加幸福于每次的牵手；\n即使吵架也会在一分钟后和好；\n即使不在身边也会每天一声我爱你；\n\n以前的思念变成了现在的柴米油盐；\n以前的距离变成了现在的拥抱；\n嘘寒问暖变成了一顿热乎乎的饭；\n千言万语化成了一个深情的吻；\n\n 幸福就是简简单单的温暖；\n幸福就是每天睡前一句晚安；\n幸福就是每天醒来第一眼看到你；\n也像你曾说过最幸福的事是抱着睡到自然醒；\n\n感谢你一直以来对我的付出；\n感谢你对我的包容与牵挂；\n感谢在我挫折时，你让我坚强；\n感谢一路有你！\n\n我最亲爱的你，情人节快乐！\n\n2014-2-14\n";
    textViewL = [[UITextView alloc] initWithFrame:CGRectMake(10, 10, ScreenWidth-20, ScreenHeight-64-40-20)];
    textViewL.backgroundColor = CLEARCOLOR;
    textViewL.textColor = RGBACOLOR(228, 251, 68, 1);
    textViewL.font = [MyFont fontWithSize:16];
    textViewL.text = stringL;
    textViewL.editable = NO;
    textViewL.indicatorStyle = UIScrollViewIndicatorStyleWhite;
    [glip.tableView addSubview:textViewL];
    
    NSString *stringR = @"每当睡醒睁开眼，想到的就是你；\n每当吃饭时，想到就是你；\n每当空闲时，想到的就是你；\n每当开心时，想到的就是你；\n每当难过时，想到的就是你；\n\n你已经融入到我的心里；\n你是我生活中不可分割的一部分；\n老婆，我爱你！\n\nI miss you all the time.\nI love you forever.\nMy heart will go on.\n\n祥  吧唧\n\n2011年12月20日";
    textViewR = [[UITextView alloc] initWithFrame:CGRectMake(ScreenWidth+10, 10, ScreenWidth-20, ScreenHeight-64-40-20)];
    textViewR.backgroundColor = CLEARCOLOR;
    textViewR.textColor = RGBACOLOR(228, 251, 68, 1);
    textViewR.font = [MyFont fontWithSize:17];
    textViewR.text = stringR;
    textViewR.editable = NO;
    textViewR.indicatorStyle = UIScrollViewIndicatorStyleWhite;
    [glip.tableView addSubview:textViewR];
    
    //底部按钮
    btnL = [CreateView createButtonWithFrame:CGRectMake(0, ScreenHeight-64-40, ScreenWidth/2.0, 40) title:@"情人节" backImage:[UIImage imageNamed:@"btnL_back_gray"] Target:self selector:@selector(changeText:)];
    btnL.tag = 1;
    [btnL setTitleColor:REDCOLOR forState:UIControlStateNormal];
    btnL.titleLabel.font = [MyFont fontWithSize:20];
    [self.view addSubview:btnL];
    
    btnR = [CreateView createButtonWithFrame:CGRectMake(ScreenWidth/2.0, ScreenHeight-64-40, ScreenWidth/2.0, 40) title:@"生日礼物" backImage:[UIImage imageNamed:@"btnR_back_light"] Target:self selector:@selector(changeText:)];
    btnR.tag = 2;
    [btnR setTitleColor:WHITECOLOR forState:UIControlStateNormal];
    btnR.titleLabel.font = [MyFont fontWithSize:20];
    [self.view addSubview:btnR];
    
    redHeart = [[UIImageView alloc] initWithFrame:CGRectMake((ScreenWidth-55.5)/2.0, ScreenHeight-64-49.5-10, 55.5, 49.5)];
    redHeart.image = [UIImage imageNamed:@"red_heart"];
    [self.view addSubview:redHeart];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self startAnimation];
    });
}

- (void)addView
{
//    if (glip)
//    {
//        glip = [RippleTableViewController new];
//        glip.rippleImageName = @"main_back";
//        [self.view insertSubview:glip.view atIndex:0];
//    }
}

- (void)hideView
{
//    [glip.view removeFromSuperview];
//    glip = nil;
    [NSThread sleepForTimeInterval:2.0];
}

- (void)startAnimation
{
    [UIView animateWithDuration:0.1 animations:^{
        CGAffineTransform tran=CGAffineTransformScale(redHeart.transform, 3.0/2.0, 3.0/2.0);
        [redHeart setTransform:tran];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.1 animations:^{
            CGAffineTransform tran=CGAffineTransformScale(redHeart.transform, 2.0/3.0, 2.0/3.0);
            [redHeart setTransform:tran];
        } completion:^(BOOL finished) {
            [self performSelector:@selector(startAnimation) withObject:nil afterDelay:0.8];
        }];
    }];
}

- (void)changeText:(UIButton *)sender
{
    if (sender.tag == 1)
    {
        [UIView animateWithDuration:0.4 animations:^{
            [btnL setTitleColor:REDCOLOR forState:UIControlStateNormal];
            [btnL setBackgroundImage:[UIImage imageNamed:@"btnL_back_gray"] forState:UIControlStateNormal];
            [btnR setTitleColor:WHITECOLOR forState:UIControlStateNormal];
            [btnR setBackgroundImage:[UIImage imageNamed:@"btnR_back_light"] forState:UIControlStateNormal];
            
            textViewL.frame = CGRectMake(10, 10, ScreenWidth-20, ScreenHeight-64-40-20);
            textViewR.frame = CGRectMake(ScreenWidth+10, 10, ScreenWidth-20, ScreenHeight-64-40-20);
        }];
    }
    else
    {
        [UIView animateWithDuration:0.4 animations:^{
            [btnL setTitleColor:WHITECOLOR forState:UIControlStateNormal];
            [btnL setBackgroundImage:[UIImage imageNamed:@"btnL_back_light"] forState:UIControlStateNormal];
            [btnR setTitleColor:REDCOLOR forState:UIControlStateNormal];
            [btnR setBackgroundImage:[UIImage imageNamed:@"btnR_back_gray"] forState:UIControlStateNormal];
            
            textViewL.frame = CGRectMake(-ScreenWidth+10, 10, ScreenWidth-20, ScreenHeight-64-40-20);
            textViewR.frame = CGRectMake(10, 10, ScreenWidth-20, ScreenHeight-64-40-20);

        }];
    }
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
