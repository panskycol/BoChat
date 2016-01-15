//
//  MTTabBar.m
//  BoChat
//
//  Created by pani on 15/12/14.
//  Copyright © 2015年 pani. All rights reserved.
//

#import "MTTabBar.h"

@interface MTTabBar ()<MTTabBarDelegate>

@property (nonatomic, weak) UIButton *plusButton;

@end


@implementation MTTabBar

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    //初始化的时候就创建一个按钮
        UIButton *plusButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [plusButton setBackgroundImage:[UIImage imageNamed: @"tabbar_compose_button"] forState:UIControlStateNormal];
        [plusButton setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
        [plusButton setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
        [plusButton setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
        
    //设置按钮的size
        plusButton.size = plusButton.currentBackgroundImage.size;
        [plusButton addTarget:self action:@selector(clickPlus) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:plusButton];
        self.plusButton = plusButton;
        self.backgroundColor = [UIColor redColor];
    }
    return self;
}


- (void)clickPlus
{
    if (self.delegate2 && [self.delegate2 respondsToSelector:@selector(tabBarDidClickPlusButton:)]) {
        [self.delegate2 tabBarDidClickPlusButton:self];
    }
}

/**
 *  设置添加按钮的位置
 */
//系统布局子控件函数，在视图开始显示布局的时候才会调用，仅在在alloc的时候是不会调用的
-(void)layoutSubviews
{
    //这个一定要有
    [super layoutSubviews];
    
    //当系统布局完了之后，重新对tabbarItem布局
    self.plusButton.centerX = self.width * 0.5;
    self.plusButton.centerY = self.height * 0.5;
    
    CGFloat tabBarButtonW   = self.width / 5;
    CGFloat tabBarIndex     = 0;
    
    for (UIView *child in self.subviews) {
        
        Class class = NSClassFromString(@"UITabBarButton");
        if ([child isKindOfClass:class]) {
            child.width     = tabBarButtonW;
            child.x         = tabBarButtonW * tabBarIndex;
            tabBarIndex ++;
            
            //预留个位置给加号
            if (tabBarIndex == 2) {
                tabBarIndex ++;
            }
        }
    }
}

















@end
