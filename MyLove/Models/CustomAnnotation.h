//
//  CustomAnnotation.h
//  MapTest
//
//  Created by HLYD on 14-4-22.
//  Copyright (c) 2014年 cn.hlyd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface CustomAnnotation : NSObject<MKAnnotation>


-(id) initWithCoordinate:(CLLocationCoordinate2D) coords;

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;
@property (nonatomic, assign) NSInteger flag;

@end
