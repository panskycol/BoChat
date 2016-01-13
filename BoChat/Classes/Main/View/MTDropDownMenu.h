//
//  MTDropDownMenu.h
//  BoChat
//
//  Created by pani on 15/12/7.
//  Copyright © 2015年 pani. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^changeBtnBLOCK)(BOOL isSelected);

@interface MTDropDownMenu : UIView

@property (nonatomic, copy) changeBtnBLOCK btnBLOCK;

/**
 *  下拉菜单的背景图片
 */
@property (nonatomic, copy) NSString *contentIamgeName;

/**
 *  内容
 */
@property (nonatomic, strong) UIView *content;

/**
 *  内容控制器
 */
@property (nonatomic, strong) UIViewController *contentController;


#pragma mark -- method
/**
 *  创建菜单
 *
 *  @return menu
 */
+ (instancetype)menu;

/**
 *  显示菜单，and设置显示位置
 */
- (void)showFrom:(UIView *)from;

/**
 *  消失菜单
 */
- (void)dismiss;



@end
