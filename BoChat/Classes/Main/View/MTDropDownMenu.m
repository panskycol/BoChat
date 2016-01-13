//
//  MTDropDownMenu.m
//  BoChat
//
//  Created by pani on 15/12/7.
//  Copyright © 2015年 pani. All rights reserved.
//

#import "MTDropDownMenu.h"

@interface MTDropDownMenu()
/**
 *  将来用来显示具体内容的容器
 */
@property (nonatomic, weak) UIImageView *containerView;
@end

@implementation MTDropDownMenu

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //去色，这里整个View就是一个蒙板，下拉菜单只是里面的一个子控件
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}


+(instancetype)menu
{
    //会调用 initWithFrame:(CGRect)frame
    return [[self alloc] init];
}

#pragma mark --创建一个下拉的背景
- (UIImageView *)containerView
{
    if (!_containerView) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.image        = [UIImage imageNamed:self.contentIamgeName];
        imageView.userInteractionEnabled = YES;
        [self addSubview:imageView];
        self.containerView     = imageView;
    }
    return _containerView;
}

#pragma mark --设置dropdownMenu的大小(已给UIView写了分类，可直接使用写x,y,width,height)
- (void)setContent:(UIView *)content
{
    _content = content;
    
    //内容在背景里面的位置
    content.origin = CGPointMake(10, 15);
    
    //背景的大小
    self.containerView.width   = CGRectGetMaxX(content.frame) + 10;
    self.containerView.height  = CGRectGetMaxY(content.frame) + 11;
    
    //把内容添加到的背景图片中
    [self.containerView addSubview:_content];
}

//UIViewController 和 UIView 是不同的
- (void)setContentController:(UIViewController *)contentController
{
    _contentController = contentController;
    self.content       = contentController.view;
}

/**
 *  设置下拉菜单的显示位置
 *
 *  @param from 被点击控件
 */
- (void)showFrom:(UIView *)from
{
    //获取最上面的view
    UIWindow *window = [[UIApplication sharedApplication].windows lastObject];
    [window addSubview:self];
    self.frame       = window.bounds;
    
    //调整灰色背景图片的位置(第一步：转换坐标系)
    CGRect newFrame = [from convertRect:from.bounds toView:window];
    self.containerView.centerX  = CGRectGetMidX(newFrame);
    self.containerView.y        = CGRectGetMaxY(newFrame);
    
}

- (void)dismiss
{
    [self removeFromSuperview];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self dismiss];
//调用block
    self.btnBLOCK(NO);
}

@end
