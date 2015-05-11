//
//  ZCTabBarController.h
//  ZCTabNavFramework
//
//  Created by cuibo on 5/8/15.
//  Copyright (c) 2015 cuibo. All rights reserved.
//


//
//  Blog:http://blog.xoneday.com
//
//  Twttter:https://twitter.com/zcsoft
//  weibo:http://weibo.com/freecu
//

#import <UIKit/UIKit.h>
#import "ZCTabBarButton.h"

@interface ZCTabBarController : UITabBarController

//中心按钮
@property(strong, readonly, nonatomic) ZCTabBarButton *centerButton;

@end

