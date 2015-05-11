//
//  FirstViewController.m
//  ZCTabNavFramework
//
//  Created by cuibo on 5/4/15.
//  Copyright (c) 2015 cuibo. All rights reserved.
//

#import "FirstViewController.h"
#import "Child1ViewContoller.h"
#import "TabbarTool.h"

@interface FirstViewController ()
<UITableViewDelegate, UITableViewDataSource>

@property(strong, nonatomic) NSMutableArray *tableData;
@property(weak, nonatomic)IBOutlet UITableView *tableView;

@end


@implementation FirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    {
        self.title = @"First";
        
        //tabbar标签
        self.tabBarItem = [TabbarTool itemWithTitle:self.title normalImg:@"1" selectImg:@"s1"];
        
        self.tableData = [[NSMutableArray alloc] initWithObjects:
                          @"Alaska",
                          @"Arizona",
                          @"Arkansas",
                          @"California",
                          @"Colorado",
                          @"Connecticut",
                          @"Delaware",
                          @"Florida",
                          @"Georgia",
                          @"Hawaii",
                          @"Idaho",
                          @"Illinois",
                          @"Indiana",
                          @"Iowa",
                          @"Kansas",
                          @"Kentucky",
                          @"Louisiana",
                          @"Maine",
                          @"Maryland",
                          @"Massachusetts",
                          @"Michigan",
                          @"Minnesota",
                          @"Mississippi",
                          @"Missouri",
                          @"Montana",
                          @"Nebraska",
                          @"Nevada",
                          @"New Hampshire",
                          @"New Jersey",
                          @"New Mexico",
                          @"New York",
                          @"North Carolina",
                          @"North Dakota",
                          @"Ohio",
                          @"Oklahoma",
                          @"Oregon",
                          @"Pennsylvania",
                          @"Rhode Island",
                          @"South Carolina",
                          @"South Dakota",
                          @"Tennessee",
                          @"Texas",
                          @"Utah",
                          @"Vermont",
                          @"Virginia",
                          @"Washington",
                          @"West Virginia",
                          @"Wisconsin",
                          @"Wyoming",
                          nil];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 
#pragma mark - UITableViewDelegate

//分区数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

//分区内行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.tableData count];
}

//行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

//单元行视图
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"FirstCellIdentifier";
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = self.tableData[indexPath.row];
    CGFloat r = 1, g = 1, b = 1;
    if(indexPath.row%3 == 0) r = 0.7;
    if(indexPath.row%3 == 1) g = 0.7;
    if(indexPath.row%3 == 2) b = 0.7;
    cell.contentView.backgroundColor = [UIColor colorWithRed:r green:g blue:b alpha:1];

    return cell;
}

//行被点击
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    Child1ViewContoller *child = [[Child1ViewContoller alloc] init];
    child.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:child animated:YES];
}

@end

