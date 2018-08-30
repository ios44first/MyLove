//
//  MyFont.m
//  MyLove
//
//  Created by mac on 14-10-16.
//  Copyright (c) 2014年 于建祥. All rights reserved.
//

#import "MyFont.h"

@implementation MyFont

+ (UIFont *)fontWithSize:(int)size
{
    return [UIFont fontWithName:@"kitty-" size:size];
}

+ (UIFont *)sysFontWithSize:(int)size
{
    return [UIFont fontWithName:@"HelveticaNeue" size:size];
}

+ (UIFont *)boldSysFontWithSize:(int)size
{
    return [UIFont fontWithName:@"HelveticaNeue-Medium" size:size];
}

@end
