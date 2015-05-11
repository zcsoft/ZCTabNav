//
//  Child1ViewContoller.m
//  ZCTabNavFramework
//
//  Created by cuibo on 5/7/15.
//  Copyright (c) 2015 cuibo. All rights reserved.
//

#import "Child1ViewContoller.h"
#import "Child2ViewContoller.h"

@interface Child1ViewContoller ()
<UITableViewDelegate, UITableViewDataSource>

@property(weak, nonatomic)IBOutlet UITableView *tableView;

@end


@implementation Child1ViewContoller

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"Child1ViewContoller";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
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
    return 50;
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
    cell.textLabel.text = [NSString stringWithFormat:@"%d", (int)indexPath.row];
    
    CGFloat r = 0.5, g = 0.5, b = 0.5;
    if(indexPath.row%3 == 0) {r = 0.7;}
    if(indexPath.row%3 == 1) {g = 0.7;}
    if(indexPath.row%3 == 2) {b = 0.7;}
    cell.contentView.backgroundColor = [UIColor colorWithRed:r green:g blue:b alpha:1];
    
    return cell;
}

//行被点击
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    Child2ViewContoller *child = [[Child2ViewContoller alloc] init];
    [self.navigationController pushViewController:child animated:YES];
}


@end


