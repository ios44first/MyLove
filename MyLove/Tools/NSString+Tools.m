//
//  NSString.m
//  MyLove
//
//  Created by mac on 14/10/17.
//  Copyright (c) 2014年 于建祥. All rights reserved.
//

#import "NSString+Tools.h"

@implementation NSString (Tools)
- (BOOL)containsString:(NSString *)string
               options:(NSStringCompareOptions)options {
    NSRange rng = [self rangeOfString:string options:options];
    return rng.location != NSNotFound;
}

- (BOOL)containsString:(NSString *)string {
    return [self containsString:string options:0];
}

- (NSString *)urldecode {
    return [self stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

- (NSString *)urlencode {
    NSString *encUrl = [self stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSUInteger len = [encUrl length];
    const char *c;
    c = [encUrl UTF8String];
    NSString *ret = @"";
    for(int i = 0; i < len; i++) {
        switch (*c) {
            case '/':
                ret = [ret stringByAppendingString:@"%2F"];
                break;
            case '\'':
                ret = [ret stringByAppendingString:@"%27"];
                break;
            case ';':
                ret = [ret stringByAppendingString:@"%3B"];
                break;
            case '?':
                ret = [ret stringByAppendingString:@"%3F"];
                break;
            case ':':
                ret = [ret stringByAppendingString:@"%3A"];
                break;
            case '@':
                ret = [ret stringByAppendingString:@"%40"];
                break;
            case '&':
                ret = [ret stringByAppendingString:@"%26"];
                break;
            case '=':
                ret = [ret stringByAppendingString:@"%3D"];
                break;
            case '+':
                ret = [ret stringByAppendingString:@"%2B"];
                break;
            case '$':
                ret = [ret stringByAppendingString:@"%24"];
                break;
            case ',':
                ret = [ret stringByAppendingString:@"%2C"];
                break;
            case '[':
                ret = [ret stringByAppendingString:@"%5B"];
                break;
            case ']':
                ret = [ret stringByAppendingString:@"%5D"];
                break;
            case '#':
                ret = [ret stringByAppendingString:@"%23"];
                break;
            case '!':
                ret = [ret stringByAppendingString:@"%21"];
                break;
            case '(':
                ret = [ret stringByAppendingString:@"%28"];
                break;
            case ')':
                ret = [ret stringByAppendingString:@"%29"];
                break;
            case '*':
                ret = [ret stringByAppendingString:@"%2A"];
                break;
            default:
                ret = [ret stringByAppendingFormat:@"%c", *c];
        }
        c++;
    }
    
    return ret;
}

- (float)heightOfStringWithWidth:(float)width font:(UIFont *)font
{
    NSString *string = self;
    if (!string) {
        string = @"无数据";
    }
    CGSize constraintSize = CGSizeMake(width, MAXFLOAT);
    CGSize labelSize = [string sizeWithFont:font constrainedToSize:constraintSize lineBreakMode:NSLineBreakByWordWrapping];
    return labelSize.height;
}

- (float)widthOfStringWithHeight:(float)height font:(UIFont *)font
{
    NSString *string = self;
    if (!string) {
        string = @"无数据";
    }
    CGSize constraintSize = CGSizeMake(MAXFLOAT, height);
    CGSize labelSize = [string sizeWithFont:font constrainedToSize:constraintSize lineBreakMode:NSLineBreakByWordWrapping];
    return labelSize.width;
}


- (NSString *)replaceUnicode:(NSString *)unicodeStr
{
    
    NSString *tempStr1 = [unicodeStr stringByReplacingOccurrencesOfString:@"\\u"withString:@"\\U"];
    NSString *tempStr2 = [tempStr1 stringByReplacingOccurrencesOfString:@"\""withString:@"\\\""];
    NSString *tempStr3 = [[@"\""stringByAppendingString:tempStr2] stringByAppendingString:@"\""];
    NSData *tempData = [tempStr3 dataUsingEncoding:NSUTF8StringEncoding];
    NSString* returnStr = [NSPropertyListSerialization propertyListFromData:tempData
                                                           mutabilityOption:NSPropertyListImmutable
                                                                     format:NULL
                                                           errorDescription:NULL];
    return [returnStr stringByReplacingOccurrencesOfString:@"\\r\\n"withString:@"\n"];
}

- (NSString *)unicodeToUTF8
{
    const char *unicodeStr = [self cStringUsingEncoding:NSUTF8StringEncoding];
    
    return [NSString stringWithCString:unicodeStr encoding:NSUTF8StringEncoding];
}

@end
