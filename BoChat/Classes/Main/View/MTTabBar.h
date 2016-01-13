//
//  MTTabBar.h
//  BoChat
//
//  Created by pani on 15/12/14.
//  Copyright © 2015年 pani. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MTTabBar;

@protocol MTTabBarDelegate <NSObject>
@optional

- (void)tabBarDidClickPlusButton:(MTTabBar *)tabBar;
@end

@interface MTTabBar : UITabBar
@property (nonatomic, weak) id<MTTabBarDelegate> delegate2;
@end
