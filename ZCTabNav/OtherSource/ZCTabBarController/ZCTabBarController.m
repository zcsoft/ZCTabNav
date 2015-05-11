//
//  ZCTabBarController.m
//  ZCTabNavFramework
//
//  Created by cuibo on 5/8/15.
//  Copyright (c) 2015 cuibo. All rights reserved.
//

#import "ZCTabBarController.h"
#import "ZCTabBarButton.h"

@interface ZCTabBarController ()

//中心按钮
@property(strong, nonatomic)ZCTabBarButton *centerButton;

@end

@implementation ZCTabBarController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //设定Tabbar的颜色
    [self.tabBar setTranslucent:YES];
    [self.tabBar setBarStyle:UIBarStyleBlack];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self.tabBar bringSubviewToFront:self.centerButton];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setViewControllers:(NSArray *)viewControllers
{
    NSInteger centerIndex = viewControllers.count/2;
    UIViewController *viewController = [[UIViewController alloc] init];
    NSMutableArray *newViewControllers = [[NSMutableArray alloc] initWithArray:viewControllers];
    [newViewControllers insertObject:viewController atIndex:centerIndex];

    [super setViewControllers:newViewControllers];

    self.centerButton = [[ZCTabBarButton alloc] initWithTabBar:self.tabBar forItemIndex:centerIndex];
}

@end

