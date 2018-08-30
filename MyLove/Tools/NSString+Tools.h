//
//  NSString.h
//  MyLove
//
//  Created by mac on 14/10/17.
//  Copyright (c) 2014年 于建祥. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Tools)

- (BOOL)containsString:(NSString *)string options:(NSStringCompareOptions)options;
- (BOOL)containsString:(NSString *)string;
- (NSString *)urlencode;
- (NSString *)urldecode;

- (float)heightOfStringWithWidth:(float)width font:(UIFont *)font;
- (float)widthOfStringWithHeight:(float)height font:(UIFont *)font;

- (NSString *)replaceUnicode:(NSString *)unicodeStr;

- (NSString *)unicodeToUTF8;


@end
