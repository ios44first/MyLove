//
//  DetailViewController.m
//  MyLove
//
//  Created by mac on 14/10/20.
//  Copyright (c) 2014年 于建祥. All rights reserved.
//

#import "DetailViewController.h"

#define CellPadding 5.0
#define NumberOfColumns 2.0

@interface DemoBrickViewCell : BrickViewCell

@property (nonatomic, readonly) UILabel *textLabel;
@property (nonatomic, readonly) UILabel *detailLabel;
@property (nonatomic, strong) UIImageView *pic;

@end

@implementation DemoBrickViewCell

- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        _textLabel = [[UILabel alloc] init];
        self.textLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.textLabel];
        _detailLabel = [[UILabel alloc] init];
        self.detailLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.detailLabel];
        
        _pic = [[UIImageView alloc] init];
        [self addSubview:self.pic];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    if (![self.detailLabel.text length]) {
        self.textLabel.frame = (CGRect) {
            .origin.x = 0.,
            .origin.y = 0.,
            .size.width = CGRectGetWidth(self.frame),
            .size.height = CGRectGetHeight(self.frame)
        };
    } else {
        self.textLabel.frame = (CGRect) {
            .origin.x = 0.,
            .origin.y = 0.,
            .size.width = CGRectGetWidth(self.frame),
            .size.height = CGRectGetHeight(self.frame) - 30,
        };
        self.detailLabel.frame = (CGRect) {
            .origin.x = 0.,
            .origin.y = CGRectGetMaxY(self.textLabel.frame) + 5,
            .size.width = CGRectGetWidth(self.frame),
            .size.height = 15,
        };
    }
    self.pic.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
}

@end


@interface DetailViewController ()<BrickViewDataSource, BrickViewDelegate>
{
    UIView *imageHDView;
    UIImageView *hdView;
    CGPoint tempCenter;
}

@property (nonatomic, strong) BrickView *brickView;
@property (nonatomic, strong) NSMutableArray *list;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupView];
}

- (void)setupView
{
    [self addBackButton];
    
    NSLog(@"self.flag = %ld",self.flag);
    
    if (self.flag==4 || self.flag==5)
    {
        UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight-20-44)];
        img.contentMode = UIViewContentModeScaleAspectFit;
        if (self.flag==4)
        {
            img.image = CreateImageJpg(@"sanmenxia1");
        }
        else
        {
            img.image = CreateImageJpg(@"yuncheng1");
        }
        [self.view addSubview:img];
    }
    else
    {
        self.brickView = [[BrickView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight-20-44)];
        
        self.list = [[NSMutableArray alloc] initWithCapacity:18];
        
        if (self.flag == 6)
        {
            [self.list addObject:CreateImageJpg(@"2013082801")];
            [self.list addObject:CreateImageJpg(@"2013082802")];
            [self.list addObject:CreateImageJpg(@"2013083103")];
            [self.list addObject:CreateImageJpg(@"2013083104")];
            [self.list addObject:CreateImageJpg(@"2013092301")];
            [self.list addObject:CreateImageJpg(@"2013092302")];
            [self.list addObject:CreateImageJpg(@"20131113")];
            [self.list addObject:CreateImageJpg(@"20131222")];
            [self.list addObject:CreateImageJpg(@"2013122802")];
            [self.list addObject:CreateImageJpg(@"2014021401")];
            [self.list addObject:CreateImageJpg(@"2014040701")];
            [self.list addObject:CreateImageJpg(@"2014041701")];
            [self.list addObject:CreateImageJpg(@"2014041702")];
            [self.list addObject:CreateImageJpg(@"2014061002")];
            [self.list addObject:CreateImageJpg(@"20140806")];
            [self.list addObject:CreateImageJpg(@"2014122202")];
        }
        else
        {
            NSString *picName = [NSString stringWithFormat:@""];
            int sum = 0;
            switch (self.flag)
            {
                case 1:
                    picName = [picName stringByAppendingString:@"he"];
                    sum = 5;
                    break;
                    
                case 2:
                    picName = [picName stringByAppendingString:@"qing"];
                    sum = 60;
                    break;
                    
                case 3:
                    picName = [picName stringByAppendingString:@"zh"];
                    sum = 37;
                    break;
                    
                case 4:
                    picName = [picName stringByAppendingString:@"san"];
                    break;
                    
                case 5:
                    picName = [picName stringByAppendingString:@"yun"];
                    break;
                    
                default:
                    break;
            }
            
            for (int i=1; i<=sum; i++)
            {
                NSString * picNameLast = [picName stringByAppendingFormat:@"%03d",i];
                NSLog(@"picName = %@",picNameLast);
                UIImage *image = CreateImageJpg(picNameLast);
                [self.list addObject:image];
            }
        }
        
        self.brickView.padding = CellPadding;
        [self.view addSubview:self.brickView];
        self.brickView.dataSource = self;
        self.brickView.delegate = self;
        
        //    UILabel *headerLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), 50)];
        //    headerLabel.text = @"HEADER";
        //    headerLabel.textAlignment = NSTextAlignmentCenter;
        //    self.brickView.headerView = headerLabel;
        //    UILabel *footerLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), 50)];
        //    footerLabel.text = @"FOOTER";
        //    footerLabel.textAlignment = NSTextAlignmentCenter;
        //    self.brickView.footerView = footerLabel;
    }
    
}


#pragma mark - accessor

- (CGFloat)brickView:(BrickView *)brickView heightForCellAtIndex:(NSInteger)index
{
    UIImage *iamg = self.list[index];
    return iamg.size.height*((ScreenWidth-CellPadding*3.0)/NumberOfColumns/iamg.size.width);
    //    CGFloat height = 0.f;
    //    switch (index%3) {
    //        case 0: {
    //            height = 100.f;
    //        }
    //            break;
    //        case 1: {
    //            height = 50.f;
    //        }
    //            break;
    //        case 2: {
    //            height = 70.f;
    //        }
    //            break;
    //    }
    //    return height;
}

- (NSInteger)numberOfColumnsInBrickView:(BrickView *)brickView
{
    return NumberOfColumns;
}


- (NSInteger)numberOfCellsInBrickView:(BrickView *)brickView
{
    return [self.list count];
}

- (BrickViewCell *)brickView:(BrickView *)brickView cellAtIndex:(NSInteger)index
{
    static NSString *CellIdentifier = @"Cell";
    DemoBrickViewCell *cell = [brickView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(!cell) {
        cell  = [[DemoBrickViewCell alloc] initWithReuseIdentifier:CellIdentifier];
    }
    cell.pic.image = self.list[index];

    return cell;
}

- (void)brickView:(BrickView *)brickView didSelectCell:(BrickViewCell *)cell AtIndex:(NSInteger)index
{
    
    [self showImageHDwithCenter:self.view.center Image:self.list[index]];
    
    //NSLog(@"did select index %d", index);
}

- (void)brickView:(BrickView *)brickView didLongPressCell:(BrickViewCell *)cell AtIndex:(NSInteger)index
{
    //    NSLog(@"did long-press index %d", index);
    //    [self.list removeObjectAtIndex:index];
    //    [brickView reloadData];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //    CGFloat bottomEdge = scrollView.contentOffset.y + CGRectGetHeight(scrollView.frame);
    //    if (bottomEdge >= floor(scrollView.contentSize.height)) {
    //        [self.list addObjectsFromArray:@[@"a",@"b",@"c",@"d",@"e",@"f",@"g",@"h",@"i",@"j",@"k",@"l",@"m",
    //                                         @"n",@"o",@"p",@"q",@"r",@"s",@"t",@"u",@"v",@"w",@"x",@"y",@"z"]];
    //        [self.brickView updateData];
    //    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    NSLog(@"end dragging");
}


#pragma mark - showImageHD

- (void)showImageHDwithCenter:(CGPoint)center Image:(UIImage *)image
{
    tempCenter = center;
    
    imageHDView = [[UIView alloc] initWithFrame:CGRectMake(tempCenter.x, tempCenter.y, 0, 0)];
    imageHDView.userInteractionEnabled = YES;
    imageHDView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.8];
    hdView = [[UIImageView alloc] initWithFrame:CGRectMake((self.view.frame.size.width-320)/2.0, (self.view.frame.size.height-320)/2.0, 320, 320)];
    hdView.tag = 200;
    hdView.image = image;
    hdView.contentMode = UIViewContentModeScaleAspectFit;
    hdView.hidden = YES;
    [imageHDView addSubview:hdView];
    [self.view addSubview:imageHDView];
    
    [self imageViewLoadedImage:hdView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideImageHDView)];
    [imageHDView addGestureRecognizer:tap];
    
    [UIView animateWithDuration:0.28 animations:^{
        imageHDView.frame = self.view.bounds;
    } completion:^(BOOL finished) {
        hdView.hidden = NO;
    }];
}

- (void)hideImageHDView
{
    if (imageHDView)
    {
        [UIView animateWithDuration:0.28 animations:^{
            hdView.hidden = YES;
            imageHDView.frame = CGRectMake(tempCenter.x, tempCenter.y, 0, 0);
        } completion:^(BOOL finished) {
            [hdView removeFromSuperview];
            [imageHDView removeFromSuperview];
        }];
    }
}

- (void)imageViewLoadedImage:(UIImageView*)imageView{
    
    if (imageView.tag == 200)
    {
        float MaxWidth = self.view.frame.size.width;
        float MaxHeight = self.view.frame.size.height;
        float currentWidth = imageView.image.size.width;
        float currentHeight = imageView.image.size.height;
        NSLog(@"EGOImageView.imageSize = %f,%f",currentWidth,currentHeight);
        if (currentHeight <= MaxHeight && currentWidth <= MaxWidth)
        {
            hdView.frame = CGRectMake((MaxWidth-currentWidth)/2.0, (MaxHeight-currentHeight)/2.0, currentWidth, currentHeight);
        }
        else if (currentHeight <= MaxHeight && currentWidth >= MaxWidth)
        {
            hdView.frame = CGRectMake(0, (MaxHeight-(MaxWidth/currentWidth)*currentHeight)/2.0, MaxWidth, (MaxWidth/currentWidth)*currentHeight);
        }
        else if (currentHeight >= MaxHeight && currentWidth <= MaxWidth)
        {
            hdView.frame = CGRectMake((MaxWidth-(MaxHeight/currentHeight)*currentWidth)/2.0, 0, (MaxHeight/currentHeight)*currentWidth, MaxHeight);
        }
        else if (currentHeight >= MaxHeight && currentWidth >= MaxWidth)
        {
            if (currentWidth/MaxWidth >= currentHeight/MaxHeight)
            {
                float realWidth = (MaxWidth/currentWidth)*currentWidth;
                float realHeight = (MaxWidth/currentWidth)*currentHeight;
                hdView.frame = CGRectMake(0, (MaxHeight-realHeight)/2.0, realWidth, realHeight);
            }
            else
            {
                float realWidth = (MaxHeight/currentHeight)*currentWidth;
                float realHeight = (MaxHeight/currentHeight)*currentHeight;
                hdView.frame = CGRectMake((MaxWidth-realWidth)/2.0, 0, realWidth, realHeight);
            }
        }
        NSLog(@"hdView.frame:%@",NSStringFromCGRect(hdView.frame));
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
