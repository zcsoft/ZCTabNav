//
//  ZCNavigationController.m
//  ZCTabNavFramework
//
//  Created by cuibo on 5/7/15.
//  Copyright (c) 2015 cuibo. All rights reserved.
//

#import "ZCNavigationController.h"

@interface ZCNavigationController ()
<
    UINavigationControllerDelegate,
    UIGestureRecognizerDelegate
>

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

    //设置滑动返回代理
    __weak ZCNavigationController *weakSelf = self;
    self.interactivePopGestureRecognizer.delegate = weakSelf;
    self.delegate = weakSelf;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 定义返回按钮

//左侧返回按钮动作
-(void)popself
{
    [self popViewControllerAnimated:YES];
}

//创建一个返回按钮
-(UIBarButtonItem*) createBackButton
{
    UIBarButtonItem *backItem=[[UIBarButtonItem alloc] init];
    backItem.title = @"";
    if(self.backImage == nil)
        self.backImage = [UIImage imageNamed:@"ZCNavigation_BackImage.png"];
    backItem.image = self.backImage;
    backItem.tintColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1];
    backItem.action = @selector(popself);
    
    return backItem;
}

#pragma mark - 解决滑动返回问题

//重载push视图
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    //push过程中禁止滑动返回手势
    self.interactivePopGestureRecognizer.enabled = NO;
    
    //push视图
    [super pushViewController:viewController animated:animated];
    //如果leftBarButtonItem没设置过，并且不是root视图
    if (viewController.navigationItem.leftBarButtonItem == nil && [self.viewControllers count] > 1)
    {
        //设置leftBarButtonItem
        viewController.navigationItem.leftBarButtonItem = [self createBackButton];
        //指定代理为自己
        super.interactivePopGestureRecognizer.delegate = (id)self;
    }
}

//navigation的一个视图将要显示（push和pop都会执行），viewController－将要显示的视图
- (void)navigationController:(UINavigationController *)navigationController
       didShowViewController:(UIViewController *)viewController
                    animated:(BOOL)animate
{
    //如果不是root视图，则打开滑动返回手势
    if([self.viewControllers count] > 1)
        self.interactivePopGestureRecognizer.enabled = YES;
    else
        self.interactivePopGestureRecognizer.enabled = NO;
}

@end


