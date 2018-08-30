//
//  PictureViewController.m
//  MyLove
//
//  Created by mac on 14/10/19.
//  Copyright (c) 2014年 于建祥. All rights reserved.
//

#import "PictureViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "PictureDetailViewController.h"
#import "UIImage+ImageEffects.h"


@interface PictureViewController ()
{
    NSMutableArray *btnArray;
    NSArray *btnColors;
    UIButton *centerBtn;
    CGPoint btnCenter;
    BOOL isShow;
    double radian;
    float radius;
}
@end

@implementation PictureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
}

- (void)setupView
{
    [self setNavigationItemTitle:@"我们的婚纱照"];
    
    UIImageView *backView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight-64)];
    
    backView.image = [[UIImage imageNamed:@"login_back"] applyBlurWithRadius:5 tintColor:[UIColor colorWithWhite:0 alpha:0.01] saturationDeltaFactor:1.f maskImage:nil];
    
//    backView.backgroundColor = RGBACOLOR(252, 65, 130, 0.2);
    [self.view addSubview:backView];
    
    
    centerBtn = [CreateView createButtonWithFrame:CGRectMake(0, 0, 82*ScreenScale, 73*ScreenScale) title:@"" backImage:CreateImagePng(@"red_heart") Target:self selector:@selector(showHideBtn:)];
//    centerBtn.layer.cornerRadius = 30;
//    centerBtn.titleLabel.font = [MyFont fontWithSize:15];
    
    NSArray *btnTitles = [NSArray arrayWithObjects:@"婚纱1",@"婚纱2",@"外景1",@"外景2",@"情侣1",@"情侣2",@"晚礼", nil];
    btnColors = [NSArray arrayWithObjects:RGBACOLOR(18, 231, 123, 1),RGBACOLOR(20, 170, 250, 1),NavigationColor,[UIColor purpleColor],[UIColor orangeColor],RGBACOLOR(120, 12, 250, 1),[UIColor magentaColor], nil];
    
    isShow = NO;
    btnArray = [NSMutableArray arrayWithCapacity:btnTitles.count+1];
    radian = 2*M_PI / (btnTitles.count);
    radius = (ScreenWidth - 120)/2.0;
    btnCenter = CGPointMake(ScreenWidth/2.0, (ScreenHeight-ScreenWidth-20-44)/3.0+ScreenWidth/2.0);
    
    for (int i=0; i<btnTitles.count; i++)
    {
        UIButton *btn = [CreateView createButtonWithFrame:CGRectMake(0, 0, 60*ScreenScale, 60*ScreenScale) title:btnTitles[i] backColor:btnColors[i] Target:self selector:@selector(showDetail:)];
        btn.titleLabel.font = [MyFont fontWithSize:15];
        btn.tag = i+1;
        btn.center = btnCenter;
        btn.layer.cornerRadius = 30*ScreenScale;
        [self.view addSubview:btn];
        [btnArray addObject:btn];
    }
    centerBtn.center = CGPointMake(btnCenter.x, btnCenter.y+1.5);
    [self.view addSubview:centerBtn];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self startAnimation];
    });
    
    UIButton *btn1 = [CreateView createButtonWithFrame:CGRectMake(20, ScreenHeight-20-44-20-30, 60, 30) title:@"相册1" backColor:NavigationColor Target:self selector:@selector(showDetail:)];
    btn1.titleLabel.font = [MyFont fontWithSize:15];
    btn1.tag = 8;
    btn1.layer.cornerRadius = 10;
    [self.view addSubview:btn1];
    
    UIButton *btn2 = [CreateView createButtonWithFrame:CGRectMake(ScreenWidth/2.0-30, ScreenHeight-20-44-20-30, 60, 30) title:@"相册2" backColor:NavigationColor Target:self selector:@selector(showDetail:)];
    btn2.titleLabel.font = [MyFont fontWithSize:15];
    btn2.tag = 9;
    btn2.layer.cornerRadius = 10;
    [self.view addSubview:btn2];
    
    UIButton *btn3 = [CreateView createButtonWithFrame:CGRectMake(ScreenWidth-20-60, ScreenHeight-20-44-20-30, 60, 30) title:@"相册3" backColor:NavigationColor Target:self selector:@selector(showDetail:)];
    btn3.titleLabel.font = [MyFont fontWithSize:15];
    btn3.tag = 10;
    btn3.layer.cornerRadius = 10;
    [self.view addSubview:btn3];
}

- (void)showDetail:(UIButton *)sender
{
    PictureDetailViewController *detail = [PictureDetailViewController new];
    detail.type = sender.tag;
    [detail setNavigationItemTitle:sender.titleLabel.text];
    [self.navigationController pushViewController:detail animated:YES];
}

- (void)showHideBtn:(UIButton *)sender
{
//    static float angle = 0;
//    CGAffineTransform rotation = CGAffineTransformMakeRotation(angle * 2*M_PI);
//    angle++;
    if (isShow)
    {
        for (int i=0; i<btnArray.count; i++)
        {
            UIButton *btn = [btnArray objectAtIndex:i];
            
            CABasicAnimation* rotationAnimation;
            rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
            rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 ];
            rotationAnimation.duration = 0.4;
            rotationAnimation.cumulative = YES;
            rotationAnimation.repeatCount = 1;
            [btn.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
            
            [UIView animateWithDuration:0.2 animations:^{
                CGPoint toPoint = btnCenter;
                toPoint.x += (radius+10) * sin(radian*i);
                toPoint.y -= (radius+10) * cos(radian*i);
                btn.center = toPoint;

                //[btn setTransform:rotation];

            } completion:^(BOOL finished) {
                [UIView animateWithDuration:0.3 animations:^{
                    btn.center = btnCenter;
                }];
            }];
        }
        isShow = NO;
    }
    else
    {
        btnColors = [btnColors sortedArrayUsingComparator:(NSComparator)^(id obj1, id obj2) {
            return (arc4random() % 3) - 1;
        }];
        for (int i=0; i<btnArray.count; i++)
        {
            UIButton *btn = [btnArray objectAtIndex:i];
            [btn setBackgroundColor:btnColors[i]];
            
            CABasicAnimation* rotationAnimation;
            rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
            rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 ];
            rotationAnimation.duration = 0.4;
            rotationAnimation.cumulative = YES;
            rotationAnimation.repeatCount = 1;
            [btn.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
            
            [UIView animateWithDuration:0.3 animations:^{
                CGPoint toPoint = btn.center;
                toPoint.x += (radius+10) * sin(radian*i);
                toPoint.y -= (radius+10) * cos(radian*i);
                btn.center = toPoint;
                
               // [btn setTransform:rotation];
                
            } completion:^(BOOL finished) {
                [UIView animateWithDuration:0.2 animations:^{
                    CGPoint toPoint = btnCenter;
                    toPoint.x += radius * sin(radian*i);
                    toPoint.y -= radius * cos(radian*i);
                    btn.center = toPoint;
                }];
            }];
            
//            CABasicAnimation* rotationAnimation =
//            [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
//            rotationAnimation.toValue = [NSNumber numberWithFloat:(2 * M_PI)];
//            rotationAnimation.duration = 1.0f;
//            rotationAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//            
//            CABasicAnimation *moveAnimation  = [CABasicAnimation animationWithKeyPath:@"position"];
//            moveAnimation.fromValue =  [NSValue valueWithCGPoint:btn.center];
//            CGPoint toPoint = btn.center;
//            toPoint.x += radius * sin(radian*i);
//            toPoint.y += radius * cos(radian*i);
//            moveAnimation.toValue = [NSValue valueWithCGPoint:toPoint];
//            moveAnimation.duration = 1.0f;
//            
//            CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
//            animationGroup.duration = 1.0f;
//            [animationGroup setAnimations:[NSArray arrayWithObjects:rotationAnimation, moveAnimation, nil]];
//            
//            [btn.layer addAnimation:animationGroup forKey:@"animationGroup"];
        }
        isShow = YES;
    }
}

- (void)startAnimation
{
    [UIView animateWithDuration:0.1 animations:^{
        CGAffineTransform tran=CGAffineTransformScale(centerBtn.transform, 3.0/2.0, 3.0/2.0);
        [centerBtn setTransform:tran];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.1 animations:^{
            CGAffineTransform tran=CGAffineTransformScale(centerBtn.transform, 2.0/3.0, 2.0/3.0);
            [centerBtn setTransform:tran];
        } completion:^(BOOL finished) {
            [self performSelector:@selector(startAnimation) withObject:nil afterDelay:1];
        }];
    }];
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
