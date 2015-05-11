//
//  MainControllerManage.h
//  ZCTabNav
//
//  Created by cuibo on 5/8/15.
//  Copyright (c) 2015 cuibo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainControllerManage : NSObject

//主视图控制器
@property(strong, readonly, nonatomic) UIViewController *mainViewController;

//获取单利
+ (id)shared;

@end
