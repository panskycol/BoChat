//
//  MTNavigationViewController.m
//  BoChat
//
//  Created by pani on 15/12/1.
//  Copyright © 2015年 pani. All rights reserved.
//

#import "MTNavigationViewController.h"

@interface MTNavigationViewController ()

@end

@implementation MTNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
}

//拦截push出来的界面，在显示前修改
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
//    NSLog(@"%ld",self.viewControllers.count);
    if (self.viewControllers.count > 0) {
        
    //设置本ViewController上的NavigationController的属性
        viewController.navigationItem.leftBarButtonItem  = [UIBarButtonItem itemWithTarget:self action:@selector(goback) WithImage:@"navigationbar_back" selectedImage:@"navigationbar_back_highlighted"];
        
        viewController.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(getMore) WithImage:@"navigationbar_more" selectedImage:@"navigationbar_more_highlighted"];
    }
    
    [super pushViewController:viewController animated:YES];
    
}

- (void)goback
{
    [self popViewControllerAnimated:YES];
}

- (void)getMore
{
    [self popToRootViewControllerAnimated:YES];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}










@end
