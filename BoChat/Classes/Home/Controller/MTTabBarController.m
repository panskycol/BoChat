//
//  MTTabBarController.m
//  BoChat
//
//  Created by pani on 15/11/30.
//  Copyright © 2015年 pani. All rights reserved.
//

#import "MTTabBarController.h"
#import "MTNavigationViewController.h"
#import "MTHomeViewController.h"
#import "MTDiscoverViewController.h"
#import "MTProfileViewController.h"
#import "MTMessageTableViewController.h"
#import "MTTabBar.h"

@interface MTTabBarController ()<MTTabBarDelegate>

@end

@implementation MTTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self createTabChildVc];
}

- (void)createTabChildVc
{
    //Home
    MTHomeViewController *hmVc = [[MTHomeViewController alloc] init];
    [self addChildViewController:hmVc image:@"tabbar_home" selectedImage:@"tabbar_home_selected" title:@"首页"];
    
    //Messager
    MTMessageTableViewController *msgVc = [[MTMessageTableViewController alloc] init];
    [self addChildViewController:msgVc image:@"tabbar_message_center" selectedImage:@"tabbar_message_center_selected" title:@"消息"];
    
    //discover
    MTDiscoverViewController *dvVc = [[MTDiscoverViewController alloc] init];
    [self addChildViewController:dvVc image:@"tabbar_discover" selectedImage:@"tabbar_discover_selected" title:@"发现"];
    
    //profile
    MTProfileViewController *pfVc = [[MTProfileViewController alloc] init];
    [self addChildViewController:pfVc image:@"tabbar_profile" selectedImage:@"tabbar_profile_selected" title:@"我"];
    
    //plusButton
    MTTabBar *tabBar = [[MTTabBar alloc] init];
    tabBar.delegate2 = self;
    [self setValue:tabBar forKeyPath:@"tabBar"];
}

#pragma mark - addChildViewController

- (void)addChildViewController:(UIViewController *)childController  image:(NSString *)imageName selectedImage:(NSString *)selectedImage title:(NSString *)titleName
{
    //设置title
    childController.title = titleName;
    
    //设置文字的样式
    NSMutableDictionary *fontAttributes            = [NSMutableDictionary dictionary];
    fontAttributes[NSForegroundColorAttributeName] = MTColor(123, 123, 123);
    NSMutableDictionary *seleFontAttrs             = [NSMutableDictionary dictionary];
    seleFontAttrs[NSForegroundColorAttributeName]  = [UIColor orangeColor];
    
    [childController.tabBarItem setTitleTextAttributes:fontAttributes forState:UIControlStateNormal];
    [childController.tabBarItem setTitleTextAttributes:seleFontAttrs forState:UIControlStateSelected];
    
    //设置tabbar选中图片,并且去除渲染颜色
    childController.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //设置tabbar图片渲染颜色
    childController.tabBarItem.image = [UIImage imageNamed:imageName];

    MTNavigationViewController *nav  = [[MTNavigationViewController alloc] initWithRootViewController:childController];
    
    [self addChildViewController:nav];
}

#pragma mark -- MTTabBarDelegate

-(void)tabBarDidClickPlusButton:(MTTabBar *)tabBar
{
    NSLog(@"plusButton");
}

@end
