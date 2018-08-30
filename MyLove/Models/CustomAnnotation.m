//
//  CustomAnnotation.m
//  MapTest
//
//  Created by HLYD on 14-4-22.
//  Copyright (c) 2014年 cn.hlyd. All rights reserved.
//

#import "CustomAnnotation.h"

@implementation CustomAnnotation
@synthesize coordinate, title, subtitle;

-(id) initWithCoordinate:(CLLocationCoordinate2D) coords
{
    if (self = [super init]) {
        coordinate = coords;
    }
    return self;
}
@end
