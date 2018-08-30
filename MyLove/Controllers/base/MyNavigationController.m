//
//  MyNavigationController.m
//  MyLove
//
//  Created by mac on 14/10/17.
//  Copyright (c) 2014年 于建祥. All rights reserved.
//

#import "MyNavigationController.h"

@interface MyNavigationController ()

@end

@implementation MyNavigationController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //self.navigationBar.barStyle = UIBarStyleBlack;
    if (!isIOS7)
    {
       // [self.navigationBar setBackgroundImage:ImageWithName(@"naviBack") forBarMetrics:(UIBarMetricsDefault)];
        self.navigationBar.tintColor =  RGBACOLOR(252, 65, 130, 1);
    }
    else
    {
        self.navigationBar.barTintColor = RGBACOLOR(252, 65, 130, 1);
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
