//
//  FourthViewController.m
//  ZCTabNavFramework
//
//  Created by cuibo on 5/4/15.
//  Copyright (c) 2015 cuibo. All rights reserved.
//

#import "FourthViewController.h"
#import "TabbarTool.h"

@interface FourthViewController ()

@end


@implementation FourthViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    {
        self.title = @"Fourth";
        
        //tabbar标签
        self.tabBarItem = [TabbarTool itemWithTitle:self.title normalImg:@"4" selectImg:@"s4"];
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

@end
