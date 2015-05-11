//
//  TabbarTool.h
//  ZCTabNavFramework
//
//  Created by cuibo on 5/8/15.
//  Copyright (c) 2015 cuibo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TabbarTool : NSObject

//创建一个标签栏的标签
+ (UITabBarItem *)itemWithTitle:(NSString *)title normalImg:(NSString *)normalImg selectImg:(NSString *)selectImg;

@end

