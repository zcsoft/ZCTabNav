//
//  TabbarTool.m
//  ZCTabNavFramework
//
//  Created by cuibo on 5/8/15.
//  Copyright (c) 2015 cuibo. All rights reserved.
//

#import "TabbarTool.h"


@implementation TabbarTool

//创建一个标签栏的标签
+ (UITabBarItem *)itemWithTitle:(NSString *)title normalImg:(NSString *)normalImg selectImg:(NSString *)selectImg
{
    UITabBarItem *tabItem;
    
    UIImage * normalImage = [[UIImage imageNamed:normalImg] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage * selectImage = [[UIImage imageNamed:selectImg] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tabItem = [[UITabBarItem alloc] initWithTitle:nil
                                            image:normalImage
                                    selectedImage:selectImage];
    //设置偏移
    //tabItem.imageInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    //tabItem.titlePositionAdjustment = (UIOffset){0, -1.f};
    
    [tabItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor greenColor]}
                                   forState:UIControlStateSelected];
    
    tabItem.title = title;
    
    return tabItem;
}

@end

