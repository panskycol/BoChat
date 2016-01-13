//
//  MTProfileViewController.m
//  BoChat
//
//  Created by pani on 15/12/2.
//  Copyright © 2015年 pani. All rights reserved.
//

#import "MTProfileViewController.h"

@interface MTProfileViewController ()

@end

@implementation MTProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"设置" style:UIBarButtonItemStylePlain target:self action:@selector(setting)];
//设置样式
    NSMutableDictionary *textAttributes                = [NSMutableDictionary dictionary];
    textAttributes[NSForegroundColorAttributeName]     = MTColor(123, 123, 123);
    NSMutableDictionary *seleTextAttributes            = [NSMutableDictionary dictionary];
    seleTextAttributes[NSForegroundColorAttributeName] = [UIColor redColor];
    
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:textAttributes forState:UIControlStateNormal];
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:seleTextAttributes forState:UIControlStateHighlighted];
    
    
}

- (void)setting
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
