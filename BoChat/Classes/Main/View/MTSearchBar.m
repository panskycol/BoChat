//
//  MTSearchBar.m
//  BoChat
//
//  Created by pani on 15/12/3.
//  Copyright © 2015年 pani. All rights reserved.
//

#import "MTSearchBar.h"

@implementation MTSearchBar


-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.font        = [UIFont systemFontOfSize:15];
        self.placeholder = @"请输入搜索内容";
        
        //设置输入框的图片
        self.background  = [UIImage imageNamed:@"searchbar_textfield_background"];
        
        //自定义搜索的图表（icon）
        UIImageView *searchIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"searchbar_textfield_search_icon"]];
        searchIcon.size = CGSizeMake(30, 30);
        
        //设置imageView里面的样式
        searchIcon.contentMode = UIViewContentModeCenter;
        self.leftView    = searchIcon;
        //不设置，上面的search小图标不能正常显示
        self.leftViewMode= UITextFieldViewModeAlways;
    }
    return self;
}

+(instancetype)SearchBar
{
    return [[self alloc] init];
}

@end
