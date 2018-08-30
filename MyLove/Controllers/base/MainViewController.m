//
//  MainViewController.m
//  MyLove
//
//  Created by mac on 14-10-15.
//  Copyright (c) 2014年 于建祥. All rights reserved.
//

#import "MainViewController.h"
#import "MainDetailViewController.h"

#define FileName      @"TextImage"
#define MessageDate   @"date"
#define MessageTitle  @"title"
#define MessageImage  @"image"


@interface MainViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *table;
    NSDictionary *dataDic;
    NSArray *allKeysArray;
    
    NSMutableArray *countArray;
}
@end

@implementation MainViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupView];
}

- (void)setupView
{
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleBlackOpaque];
    
    UIImageView *backView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight-64)];
    //backView.image = [UIImage imageNamed:@"picture_back"];
    backView.backgroundColor = RGBACOLOR(252, 65, 130, 0.2);
    [self.view addSubview:backView];
    
    UIView *line = [CreateView createViewWithFrame:CGRectMake(10, 0, 4, ScreenHeight-64) backColor:[UIColor whiteColor]];
    [backView addSubview:line];
    
    [self setNavigationItemTitle:@"爱情旅程"];
    
    table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight-64) style:UITableViewStylePlain];
    table.separatorColor = CLEARCOLOR;
    table.backgroundColor = CLEARCOLOR;
    table.indicatorStyle = UIScrollViewIndicatorStyleWhite;
    table.delegate = self;
    table.dataSource = self;
    [self.view addSubview:table];
    
    [self getData];
}

- (void)getData
{
    dataDic = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:FileName ofType:@"plist"]];
    NSLog(@"plist=%@",dataDic);

    allKeysArray = [[dataDic allKeys] sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        return [obj1 compare:obj2];
    }];
    
    countArray = [NSMutableArray arrayWithCapacity:allKeysArray.count];
    for (int i=0; i<allKeysArray.count; i++)
    {
        [countArray addObject:@([[dataDic valueForKey:[allKeysArray objectAtIndex:i]] count])];
    }
}

-(void)viewDidLayoutSubviews
{
    if ([table respondsToSelector:@selector(setSeparatorInset:)]) {
        [table setSeparatorInset:UIEdgeInsetsMake(0,0,0,0)];
    }
    
    if ([table respondsToSelector:@selector(setLayoutMargins:)]) {
        [table setLayoutMargins:UIEdgeInsetsMake(0,0,0,0)];
    }
}

- (void)changeSectionCount:(UIControl *)con
{
    if ([[countArray objectAtIndex:con.tag] intValue])
    {
        [countArray replaceObjectAtIndex:con.tag withObject:@(0)];
    }
    else
    {
        [countArray replaceObjectAtIndex:con.tag withObject:@([[dataDic valueForKey:[allKeysArray objectAtIndex:con.tag]] count])];
    }
    [table reloadData];
}

#pragma mark - tableView 代理

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *reuseCellId = @"Cell";
    TextImageCell *cell = (TextImageCell *)[tableView dequeueReusableCellWithIdentifier:reuseCellId];
    if (!cell)
    {
        cell = [[TextImageCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseCellId];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = CLEARCOLOR;
    }
    
    NSDictionary *messageDic = [[dataDic valueForKey:[allKeysArray objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row];
    cell.timeLabel.text = [messageDic valueForKey:MessageDate];
    cell.titleLabel.text = [messageDic valueForKey:MessageTitle];
    cell.content = [messageDic valueForKey:MessageTitle];
    
    cell.more.hidden = YES;
    cell.pic1.image = nil;
    cell.pic2.image = nil;
    cell.pic3.image = nil;
    cell.pic4.image = nil;
    if ([messageDic valueForKey:MessageImage])
    {
        NSArray *imageNames = [messageDic valueForKey:MessageImage];
        if (imageNames.count>=4)
        {
            if (imageNames.count>4)
            {
                cell.more.hidden = NO;
            }
            cell.pic1.image = CreateImageJpg([imageNames objectAtIndex:0]);
            cell.pic2.image = CreateImageJpg([imageNames objectAtIndex:1]);
            cell.pic3.image = CreateImageJpg([imageNames objectAtIndex:2]);
            cell.pic4.image = CreateImageJpg([imageNames objectAtIndex:3]);
        }
        else if (imageNames.count==3)
        {
            cell.pic1.image = CreateImageJpg([imageNames objectAtIndex:0]);
            cell.pic2.image = CreateImageJpg([imageNames objectAtIndex:1]);
            cell.pic3.image = CreateImageJpg([imageNames objectAtIndex:2]);
        }
        else if (imageNames.count==2)
        {
            cell.pic1.image = CreateImageJpg([imageNames objectAtIndex:0]);
            cell.pic2.image = CreateImageJpg([imageNames objectAtIndex:1]);
        }
        else
        {
            cell.pic1.image = CreateImageJpg([imageNames objectAtIndex:0]);
        }
    }
//    [cell layoutSubviews];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSDictionary *messageDic = [[dataDic valueForKey:[allKeysArray objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row];
    if ([messageDic valueForKey:MessageImage])
    {
        MainDetailViewController *md = [MainDetailViewController new];
        [md setNavigationItemTitle:[messageDic valueForKey:MessageDate]];
        md.imageArray = [messageDic valueForKey:MessageImage];
        [self.navigationController pushViewController:md animated:YES];
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *messageDic = [[dataDic valueForKey:[allKeysArray objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row];
    NSString *title = [messageDic valueForKey:MessageTitle];
    float height = [title sizeWithFont:[MyFont fontWithSize:16] constrainedToSize:CGSizeMake(ScreenWidth-45, MAXFLOAT)].height+20;

    if ([messageDic valueForKey:MessageImage])
    {
        float count = [[messageDic valueForKey:MessageImage] count];
        if (count>4)
        {
            height += (ScreenWidth-45+20);
        }
        else if (count == 3 || count == 4)
        {
            height += (ScreenWidth-45);
        }
        else if (count == 1 || count == 2)
        {
            height += ((ScreenWidth-45-15)/2.0)+10;
        }
    }
    else
    {
        height += 15;
    }
    
    return height+30;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [CreateView createViewWithFrame:CGRectMake(0, 0, ScreenWidth, 25) backColor:RGBACOLOR(253, 142, 181, 1)];
    UILabel *title = [CreateView createLabelWithFrame:CGRectMake(40, 0, ScreenWidth-80, 25) title:[allKeysArray objectAtIndex:section] fontSize:16 backColor:CLEARCOLOR textColor:WHITECOLOR textAlignment:NSTextAlignmentLeft];
    [view addSubview:title];
    
    title.font = [MyFont fontWithSize:16];
    
    UIView *line1 = [CreateView createViewWithFrame:CGRectMake(0, 0, ScreenWidth, 1) backColor:RGBACOLOR(252, 65, 130, 1)];
    UIView *line2 = [CreateView createViewWithFrame:CGRectMake(0, 24, ScreenWidth, 1) backColor:RGBACOLOR(252, 65, 130, 1)];
    [view addSubview:line1];
    [view addSubview:line2];
    
    UIControl *con = [[UIControl alloc] initWithFrame:view.bounds];
    con.backgroundColor = CLEARCOLOR;
    [con addTarget:self action:@selector(changeSectionCount:) forControlEvents:UIControlEventTouchUpInside];
    con.tag = section;
    [view addSubview:con];
    
    return view;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 25;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[countArray objectAtIndex:section] intValue];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return allKeysArray.count;
}


-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
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
