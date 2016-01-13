//
//  MTHomeViewController.m
//  BoChat
//
//  Created by pani on 15/12/2.
//  Copyright © 2015年 pani. All rights reserved.
//

#import "MTHomeViewController.h"
#import "SeachfriedTestViewController.h"
#import "MTDropDownMenu.h"
#import "HWTitleMenuViewController.h"

@interface MTHomeViewController ()
@property (nonatomic, strong)UIButton *titleButton;

@end

@implementation MTHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
//覆盖类别里面的Navigation样式
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(friendSearch) WithImage:@"navigationbar_friendsearch" selectedImage:@"navigationbar_friendsearch_highlighted"];
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(pop) WithImage:@"navigationbar_pop" selectedImage:@"navigationbar_pop_highlighted"];
    
//创建中间按钮
    _titleButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _titleButton.size = CGSizeMake(150, 25);
    
//设置图片和文字颜色大小
    [_titleButton setImage:[UIImage imageNamed:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
    _titleButton.selected  = YES;

    [_titleButton setTitle:@"首页" forState:UIControlStateNormal];
    [_titleButton setTitleColor: [UIColor blackColor] forState:UIControlStateNormal];
    _titleButton.titleLabel.font = [UIFont boldSystemFontOfSize:17];
    
    _titleButton.imageEdgeInsets = UIEdgeInsetsMake(0, 70, 0, 0);
    _titleButton.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 40);
    
    [_titleButton addTarget:self action:@selector(showDropDownMenu:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.titleView = _titleButton;
}



//创建一个下拉菜单
- (void)showDropDownMenu:(UIButton *)btn
{
    MTDropDownMenu *Menu = [MTDropDownMenu menu];
    Menu.contentIamgeName = @"popover_background";
    
    HWTitleMenuViewController *content = [[HWTitleMenuViewController alloc] init];
    content.view.height    = 150;
    content.view.width     = 150;
    Menu.contentController = content;
    
    Menu.btnBLOCK = ^(BOOL isSelected){
        [btn setImage:[UIImage imageNamed:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
        _titleButton.selected = !isSelected;
    };
    if (_titleButton.selected) {
         [btn setImage:[UIImage imageNamed:@"navigationbar_arrow_up"] forState:UIControlStateNormal];
        _titleButton.selected = NO;
    }else{
        [btn setImage:[UIImage imageNamed:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
        _titleButton.selected = YES;
    }
    [Menu showFrom:btn];
}

- (void)pop
{
    SeachfriedTestViewController *sv = [[SeachfriedTestViewController alloc] init];
    sv.navigationItem.title = @"pop测试";
    
    [self.navigationController pushViewController:sv animated:YES];
}

- (void)friendSearch
{
    SeachfriedTestViewController *sv = [[SeachfriedTestViewController alloc] init];
    sv.navigationItem.title = @"添加好友页面测试";
    
    [self.navigationController pushViewController:sv animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}

@end
