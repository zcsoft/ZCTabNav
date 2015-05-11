//
//  MainControllerManage.m
//  ZCTabNav
//
//  Created by cuibo on 5/8/15.
//  Copyright (c) 2015 cuibo. All rights reserved.
//

#import "MainControllerManage.h"
#import "ZCTabBarController.h"
#import "ZCNavigationController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"
#import "ZCTabBarButton.h"

#import "Child2ViewContoller.h"


@interface MainControllerManage()


@property(strong, nonatomic) UIViewController *mainViewController;              //主视图(tabbar)
@property (strong, nonatomic) ZCTabBarController *tabBarController;             //tabbar;

//TabBarController的内容视图
@property(strong, nonatomic) FirstViewController *firstViewController;
@property(strong, nonatomic) SecondViewController *secondViewController;
@property(strong, nonatomic) ThirdViewController *thirdViewController;
@property(strong, nonatomic) FourthViewController *fourthViewController;

@end


@implementation MainControllerManage

//获取单利
+ (id)shared
{
    static MainControllerManage *_shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shared = [[MainControllerManage alloc] init];
    });
    
    return _shared;
}

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        //创建主视图
        self.mainViewController = [self creatMainController];
    }
    return self;
}

- (UIViewController *)creatMainController
{
    //创建tabbar内容视图
    self.firstViewController = [[FirstViewController alloc] init];
    self.secondViewController = [[SecondViewController alloc] init];
    self.thirdViewController = [[ThirdViewController alloc] init];
    self.fourthViewController = [[FourthViewController alloc] init];
    
    //将内容视图装载到NavigationController里
    ZCNavigationController *navController1 = [[ZCNavigationController alloc] initWithRootViewController:self.firstViewController];
    ZCNavigationController *navController2 = [[ZCNavigationController alloc] initWithRootViewController:self.secondViewController];
    ZCNavigationController *navController3 = [[ZCNavigationController alloc] initWithRootViewController:self.thirdViewController];
    ZCNavigationController *navController4 = [[ZCNavigationController alloc] initWithRootViewController:self.fourthViewController];
    
    //创建并设置tabBarController
    self.tabBarController = [[ZCTabBarController alloc] init];
    self.tabBarController.viewControllers = [NSArray arrayWithObjects:navController1, navController2, navController3, navController4, nil];
    self.tabBarController.selectedIndex = 0;

    //设置tabBar中间的按钮
    [self.tabBarController.centerButton setHeightOffset:5];
    [self.tabBarController.centerButton setImage:[UIImage imageNamed:@"icon_publish"]
                                        forState:UIControlStateNormal];
    [self.tabBarController.centerButton setImage:[UIImage imageNamed:@"icon_publish_light"]
                                        forState:UIControlStateHighlighted];
    [self.tabBarController.centerButton addTarget:self
                                           action:@selector(centerButtonPressed)
                                 forControlEvents:UIControlEventTouchUpInside];

    return self.tabBarController;
}


#pragma mark -
#pragma mark - tabbar中间的按钮动作

//按钮按下
- (void)centerButtonPressed
{
    //弹出child2
    Child2ViewContoller *child2 = [[Child2ViewContoller alloc] init];
    [self.tabBarController presentViewController:child2 animated:YES completion:nil];
}


@end


