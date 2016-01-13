//
//  UIBarButtonItem+Extension.m
//  BoChat
//
//  Created by pani on 15/12/1.
//  Copyright © 2015年 pani. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"

@implementation UIBarButtonItem (Extension)

+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action WithImage:(NSString *)imageName selectedImage:(NSString *)selecImageName
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    //设置图片
    [btn setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:selecImageName] forState:UIControlStateHighlighted];
    
    //设置大小
    btn.frame = CGRectMake(0, 0, btn.currentBackgroundImage.size.width, btn.currentBackgroundImage.size.height);
    
    //设置动作
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}


@end
