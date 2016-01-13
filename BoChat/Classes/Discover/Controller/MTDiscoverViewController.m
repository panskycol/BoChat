//
//  MTDiscoverViewController.m
//  BoChat
//
//  Created by pani on 15/12/2.
//  Copyright © 2015年 pani. All rights reserved.
//

#import "MTDiscoverViewController.h"
#import "MTSearchBar.h"

@interface MTDiscoverViewController ()

@end

@implementation MTDiscoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MTSearchBar *searchBar = [MTSearchBar SearchBar];
    //已重写size的getter
    //这里的6s的搜索框要设置为360*30才能显示正常
    searchBar.size = CGSizeMake(360, 30);
    self.navigationItem.titleView = searchBar;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
