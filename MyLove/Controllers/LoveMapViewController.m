//
//  LoveMapViewController.m
//  MyLove
//
//  Created by mac on 14/10/19.
//  Copyright (c) 2014年 于建祥. All rights reserved.
//

#import "LoveMapViewController.h"
#import <MapKit/MapKit.h>

@interface LoveMapViewController ()
{
    MKMapView *map;
    NSMutableArray *annoArray;
}
@end

@implementation LoveMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupView];
}

- (void)setupView
{
    [self setNavigationItemTitle:@"我们的足迹"];
    
    //显示地图
    map = [[MKMapView alloc] initWithFrame:[self.view bounds]];
    map.mapType = MKMapTypeStandard; //标准地图
    map.delegate = self;
    [self.view addSubview:map];
    
    //显示具体的经纬度
    CLLocationCoordinate2D coords = CLLocationCoordinate2DMake(35.2280626721,115.4631033542);
    float zoomLevel = 11.8; //视野范围
    MKCoordinateRegion region = MKCoordinateRegionMake(coords, MKCoordinateSpanMake(zoomLevel, zoomLevel));
    [map setRegion:[map regionThatFits:region] animated:YES];

}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self showAddress];
}

-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [map removeAnnotations:annoArray];
    [annoArray removeAllObjects];
    annoArray = nil;
}

- (void)showAddress
{
    if (annoArray)
    {
        [map removeAnnotations:annoArray];
        [annoArray removeAllObjects];
    }
    else
    {
        annoArray = [NSMutableArray arrayWithCapacity:6];
    }
    
    //菏泽
    CLLocationCoordinate2D coords1 = CLLocationCoordinate2DMake(35.2280626721,115.4631033542);
    CustomAnnotation *ann1 = [self createAnnotationWithCoords:coords1 title:@"菏泽（初次见面）" subTitle:@"2013.2.10" withTag:1];
    [annoArray addObject:ann1];
    [map selectAnnotation:ann1 animated:YES];
    
    //青岛
    CLLocationCoordinate2D coords2 = CLLocationCoordinate2DMake(36.0691103309,120.3267845783);
    CustomAnnotation *ann2 = [self createAnnotationWithCoords:coords2 title:@"青岛（春节旅游）" subTitle:@"2013.2.11-2.14" withTag:2];
    [annoArray addObject:ann2];
    
    //郑州
    CLLocationCoordinate2D coords3 = CLLocationCoordinate2DMake(34.7431080548,113.6607610503);
    CustomAnnotation *ann3 = [self createAnnotationWithCoords:coords3 title:@"郑州（二次见面）" subTitle:@"2013.6.22-6.23" withTag:3];
    [annoArray addObject:ann3];
    
    //三门峡
    CLLocationCoordinate2D coords4 = CLLocationCoordinate2DMake(34.7604184931,111.2306935622);
    CustomAnnotation *ann4 = [self createAnnotationWithCoords:coords4 title:@"三门峡（初见家人）" subTitle:@"2013.8.22" withTag:4];
    [annoArray addObject:ann4];
    
    //郓城
    CLLocationCoordinate2D coords5 = CLLocationCoordinate2DMake(35.8024112570,115.7775810110);
    CustomAnnotation *ann5 = [self createAnnotationWithCoords:coords5 title:@"郓城（初见家人）" subTitle:@"2014.02.04" withTag:5];
    [annoArray addObject:ann5];
    
    //北京
    CLLocationCoordinate2D coords6 = CLLocationCoordinate2DMake(39.9075509087,116.1926223186);
    CustomAnnotation *ann6 = [self createAnnotationWithCoords:coords6 title:@"北京（一起奋斗起点）" subTitle:@"2013.8.26-今" withTag:6];
    [annoArray addObject:ann6];
}

- (void)gotoDetail:(UIControl *)sender
{
    CustomAnnotation *ann = [annoArray objectAtIndex:sender.tag-1];
    DetailViewController *detail = [[DetailViewController alloc] init];
    detail.type = @"map";
    detail.flag = ann.flag;
    [detail setNavigationItemTitle:ann.title];
    [self.navigationController pushViewController:detail animated:YES];
}

#pragma mark  - mapView 代理

-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    static NSString *defaultPinID = @"MKPinAnnotationView";
    MKAnnotationView *pinView = [mapView dequeueReusableAnnotationViewWithIdentifier:defaultPinID];
    if (!pinView)
    {
        pinView = [[MKPinAnnotationView alloc]
                    initWithAnnotation:annotation reuseIdentifier:defaultPinID];
    }
    MKPinAnnotationView *pin = (MKPinAnnotationView *)pinView;
    pin.canShowCallout = YES;
    pin.animatesDrop = YES;
    CustomAnnotation *an = (CustomAnnotation *)annotation;
    UIButton *btn = [CreateView createButtonWithFrame:CGRectMake(0, 0, 30, 30) title:@"" backImage:[UIImage imageNamed:@"rightnew"] Target:self selector:@selector(gotoDetail:)];
    btn.tag = an.flag;
    pin.rightCalloutAccessoryView = btn;
    return pin;
}

//-(void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view
//{
//    CustomAnnotation *annotation = (CustomAnnotation *)view;
//    NSLog(@"annotation.tag = %ld",annotation.flag);
//}

#pragma mark  - 创建大头针的方法

-(CustomAnnotation *)createAnnotationWithCoords:(CLLocationCoordinate2D)coords title:(NSString *)title subTitle:(NSString *)subTitle withTag:(int)flag
{
    CustomAnnotation *annotation = [[CustomAnnotation alloc] initWithCoordinate:
                                    coords];
    annotation.title = title;
    annotation.subtitle = subTitle;
    annotation.flag = flag;
    [map addAnnotation:annotation];
    //[map selectAnnotation:annotation animated:YES];
    return annotation;
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
