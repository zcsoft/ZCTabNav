#import <UIKit/UIKit.h>


@class ZCTabBarButton;

@interface ZCTabBarButton : UIButton

//按钮当前所在的TabBar
@property (nonatomic, weak, readonly) UITabBar *tabBar;
//当前按钮在TabBar的位置
@property (nonatomic, assign, readonly) NSUInteger locationIndexInTabBar;
//设置按钮上下偏移位置
@property (nonatomic, assign) CGFloat heightOffset;

//初始化按钮并添加到tabbar上
- (instancetype)initWithTabBar:(UITabBar*)tabBar
                 forItemIndex:(NSUInteger)itemIndex;


@end

