//
//  PictureDetailViewController.m
//  MyLove
//
//  Created by mac on 14/12/23.
//  Copyright (c) 2014年 于建祥. All rights reserved.
//

#import "PictureDetailViewController.h"

@interface PictureDetailViewController ()

@end

@implementation PictureDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupView];
}


- (void)setupView
{
    [self addBackButton];
    
    UIImageView *backView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight-64)];
    backView.backgroundColor = BLACKCOLOR;
    [self.view addSubview:backView];
    
   // NSLog(@"%d",self.type);
    
    self.imageNames = [[NSMutableArray alloc] initWithCapacity:18];
    
    NSString *picName = [NSString stringWithFormat:@""];
    int sum = 0;
    switch (self.type)
    {
        case 1:
            picName = [picName stringByAppendingString:@"hunsha1"];
            sum = 12;
            break;
            
        case 2:
            picName = [picName stringByAppendingString:@"hunsha2"];
            sum = 17;
            break;
            
        case 3:
            picName = [picName stringByAppendingString:@"waijing1"];
            sum = 18;
            break;
            
        case 4:
            picName = [picName stringByAppendingString:@"waijing2"];
            sum = 8;
            break;
            
        case 5:
            picName = [picName stringByAppendingString:@"qinglv1"];
            sum = 11;
            break;
            
        case 6:
            picName = [picName stringByAppendingString:@"qinglv2"];
            sum = 15;
            break;
            
        case 7:
            picName = [picName stringByAppendingString:@"wanli"];
            sum = 15;
            break;
            
        case 8:
            picName = [picName stringByAppendingString:@"10cun"];
            sum = 11;
            break;
            
        case 9:
            picName = [picName stringByAppendingString:@"12cun"];
            sum = 11;
            break;
            
        case 10:
            picName = [picName stringByAppendingString:@"16cun"];
            sum = 11;
            break;
            
        default:
            break;
    }
    
    if (self.type>7)
    {
        for (int i=0; i<sum; i++)
        {
            NSString * picNameLast = [picName stringByAppendingFormat:@"%02d",i];
            NSLog(@"picNameLast = %@",picNameLast);
            [self.imageNames addObject:picNameLast];
        }
    }
    else
    {
        for (int i=1; i<=sum; i++)
        {
            NSString * picNameLast = [picName stringByAppendingFormat:@"%03d",i];
            NSLog(@"picNameLast = %@",picNameLast);
            [self.imageNames addObject:picNameLast];
        }
    }
    
    carousel = [[iCarousel alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, (ScreenHeight-64))];
    carousel.dataSource = self;
    carousel.delegate = self;
    carousel.layer.masksToBounds = YES;
    carousel.type = iCarouselTypeCoverFlow2;
    [self.view addSubview:carousel];
}



#pragma mark - iCarousel methods

-(NSUInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    //返回图片的张数
    return [self.imageNames count];
}

-(UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSUInteger)index
{
    UIImageView * view = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth*0.9, ScreenHeight-64)];
    if (self.type>7)
    {
        view.backgroundColor = CLEARCOLOR;
    }
    else
    {
        view.backgroundColor = RGBACOLOR(255, 255, 255, 0.2);
    }
    view.contentMode = UIViewContentModeScaleAspectFit;

    view.image = CreateImageJpg(self.imageNames[index]);
    
    return view;
}

- (NSUInteger)numberOfPlaceholdersInCarousel:(iCarousel *)carousel
{
    return 0;
}

//可见视图
- (NSUInteger)numberOfVisibleItemsInCarousel:(iCarousel *)carousel
{
    return 7;
}

//滑动---间距
- (CGFloat)carouselItemWidth:(iCarousel *)carousel
{
    return ScreenWidth * 0.7;
}

- (CATransform3D)carousel:(iCarousel *)_carousel transformForItemView:(UIView *)view withOffset:(CGFloat)offset
{
    view.alpha = 1.0 - fminf(fmaxf(offset, 0.0), 1.0);
    
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = carousel.perspective;
    transform = CATransform3DRotate(transform, M_PI / 8.0, 0, 1.0, 0);
    return CATransform3DTranslate(transform, 0.0, 0.0, offset * carousel.itemWidth);
}

- (BOOL)carouselShouldWrap:(iCarousel *)carousel
{
    return NO;
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
