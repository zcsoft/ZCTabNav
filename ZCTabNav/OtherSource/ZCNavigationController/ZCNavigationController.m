//
//  ZCNavigationController.m
//  ZCTabNavFramework
//
//  Created by cuibo on 5/7/15.
//  Copyright (c) 2015 cuibo. All rights reserved.
//

#import "ZCNavigationController.h"

@interface ZCNavigationController ()

@end


@implementation ZCNavigationController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    //translucent效果导航设置hidesBottomBarWhenPushed时候，push动画navbar右侧会显示出window。这样做看起来会有所改善。但没有彻底解决。
    //问题描述：http://stackoverflow.com/questions/30159565/ios7-8-translucent-navigationbar-top-right-corner-of-the-black
    self.view.backgroundColor = [UIColor whiteColor];
    
    //自定义样式
    [self.navigationBar setTranslucent:YES];
    [self.navigationBar setBarStyle:UIBarStyleBlackTranslucent];
    [self.navigationBar setTitleTextAttributes:@{ NSFontAttributeName:[UIFont boldSystemFontOfSize:18.0], NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    //返回按钮上标题的颜色
    self.navigationBar.tintColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 定制返回按钮

//创建一个返回按钮
-(UIBarButtonItem*) createBackButton
{
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] init];
    backItem.title = @"123";
    if(self.backImage == nil)
        self.backImage = [UIImage imageNamed:@"ZCNavigation_BackImage.png"];
    //图片右侧2像素将被拉伸，所以图片右侧需要有两像素的透明空白
    [backItem setBackButtonBackgroundImage:[self.backImage resizableImageWithCapInsets:UIEdgeInsetsMake(0, self.backImage.size.width-2, 0, 1)]
                                  forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    backItem.tintColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1];
    return backItem;
}

//重载push视图
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    //设置backBarButtonItem
    UIViewController *vc = [self.viewControllers lastObject];
    vc.navigationItem.backBarButtonItem = [self createBackButton];
    //push视图
    [super pushViewController:viewController animated:animated];
}

@end


