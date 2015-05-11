//
//  ThirdViewController.m
//  ZCTabNavFramework
//
//  Created by cuibo on 5/4/15.
//  Copyright (c) 2015 cuibo. All rights reserved.
//

#import "ThirdViewController.h"
#import "TabbarTool.h"
#import "Child2ViewContoller.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    {
        self.title = @"Third";
        
        //tabbar标签
        self.tabBarItem = [TabbarTool itemWithTitle:self.title normalImg:@"3" selectImg:@"s3"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//动作按钮
- (IBAction)buttonAction:(id)sender
{
    //弹出child2
    Child2ViewContoller *child2 = [[Child2ViewContoller alloc] init];
    [self.navigationController pushViewController:child2 animated:YES];
}

@end
