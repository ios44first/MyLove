//
//  MyFont.h
//  MyLove
//
//  Created by mac on 14-10-16.
//  Copyright (c) 2014年 于建祥. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyFont : NSObject

+ (UIFont *)fontWithSize:(int)size;
+ (UIFont *)sysFontWithSize:(int)size;
+ (UIFont *)boldSysFontWithSize:(int)size;

@end
