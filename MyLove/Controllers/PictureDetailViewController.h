//
//  PictureDetailViewController.h
//  MyLove
//
//  Created by mac on 14/12/23.
//  Copyright (c) 2014年 于建祥. All rights reserved.
//

#import "BaseViewController.h"
#import "iCarousel.h"

@interface PictureDetailViewController : BaseViewController<iCarouselDataSource, iCarouselDelegate>
{
    iCarousel *carousel;
}

@property (nonatomic,assign) NSInteger type;
@property (nonatomic,strong) NSMutableArray *imageNames;

@end
