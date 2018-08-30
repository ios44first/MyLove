//
//  MainDetailViewController.m
//  MyLove
//
//  Created by mac on 14/12/19.
//  Copyright (c) 2014年 于建祥. All rights reserved.
//

#import "MainDetailViewController.h"

@interface MainDetailViewController ()
{
    UIImageView *imageView;
    UILabel *showIndex;
    int currentIndex;
    CGRect orginFrame;
    CGPoint imageCenter;
    float imageViewHeight;
}
@end

@implementation MainDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupView];
}

- (void)setupView
{
    [self addBackButton];
    
    self.view.backgroundColor = BLACKCOLOR;
    
    imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight-20-44-20)];
    orginFrame = imageView.frame;
    NSLog(@"orginFrame = %@",NSStringFromCGRect(orginFrame));
    imageCenter = imageView.center;
    imageViewHeight = imageView.frame.size.height;
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.image = CreateImageJpg([self.imageArray firstObject]);
    if (imageView.image.size.height<=ScreenWidth && imageView.image.size.width<=imageViewHeight)
    {
        imageView.frame = CGRectMake(0, 0, imageView.image.size.width, imageView.image.size.height);
        imageView.center = imageCenter;
    }
    imageView.userInteractionEnabled = YES;
    imageView.layer.masksToBounds = YES;
    [self.view addSubview:imageView];
    
    UISwipeGestureRecognizer *swipL = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(changeImage:)];
    swipL.direction = UISwipeGestureRecognizerDirectionLeft;
    [imageView addGestureRecognizer:swipL];
    
    UISwipeGestureRecognizer *swipR = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(changeImage:)];
    swipR.direction = UISwipeGestureRecognizerDirectionRight;
    [imageView addGestureRecognizer:swipR];
    
    
    showIndex = [[UILabel alloc] initWithFrame:CGRectMake(0, ScreenHeight-20-44-20, ScreenWidth, 20)];
    showIndex.backgroundColor = CLEARCOLOR;
    showIndex.textColor = WHITECOLOR;
    showIndex.textAlignment = NSTextAlignmentCenter;
    showIndex.text = [NSString stringWithFormat:@"%d/%ld",1,self.imageArray.count];
    [self.view addSubview:showIndex];
    
    currentIndex = 0;
    
}

- (void)changeImage:(UISwipeGestureRecognizer *)swip
{
    if (swip.direction == UISwipeGestureRecognizerDirectionLeft)
    {
        [self nextImage:YES];
    }
    else if (swip.direction == UISwipeGestureRecognizerDirectionRight)
    {
        [self nextImage:NO];
    }
}

- (void)nextImage:(BOOL)isLeft
{
//    [UIView beginAnimations:@"image" context:@"卷起"];
//    [UIView setAnimationDuration:1.0f];
//    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    if (isLeft)
    {
//        [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:imageView cache:YES];
        currentIndex++;
        if (currentIndex < self.imageArray.count)
        {
            [UIView transitionWithView:imageView duration:0.8 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
                imageView.image = CreateImageJpg([self.imageArray objectAtIndex:currentIndex]);
                if (imageView.image.size.height<=ScreenWidth && imageView.image.size.width<=imageViewHeight)
                {
                    imageView.frame = CGRectMake(0, 0, imageView.image.size.width, imageView.image.size.height);
                    imageView.center = imageCenter;
                }
                else
                {
                    imageView.frame = orginFrame;
                }
            } completion:^(BOOL finished) {
                showIndex.text = [NSString stringWithFormat:@"%d/%ld",currentIndex+1,self.imageArray.count];
            }];
            
//            [UIView commitAnimations];
        }
        else
        {
            currentIndex = self.imageArray.count - 1;
            [self showSingleAlertWith:@"已是最后一张"];
        }
    }
    else
    {
//        [UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:imageView cache:YES];
        currentIndex--;
        if (currentIndex >=0)
        {
            [UIView transitionWithView:imageView duration:0.8 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
                imageView.image = CreateImageJpg([self.imageArray objectAtIndex:currentIndex]);
                if (imageView.image.size.height<=ScreenWidth && imageView.image.size.width<=imageViewHeight)
                {
                    imageView.frame = CGRectMake(0, 0, imageView.image.size.width, imageView.image.size.height);
                    imageView.center = imageCenter;
                }
                else
                {
                    imageView.frame = orginFrame;
                }
            } completion:^(BOOL finished) {
                showIndex.text = [NSString stringWithFormat:@"%d/%ld",currentIndex+1,self.imageArray.count];
            }];
            
//            [UIView commitAnimations];
        }
        else
        {
            currentIndex = 0;
            [self showSingleAlertWith:@"已是第一张"];
        }
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
