//
//  MTNewFeatureViewController.m
//  BoChat
//
//  Created by pani on 15/12/25.
//  Copyright © 2015年 pani. All rights reserved.
//

#import "MTNewFeatureViewController.h"
#import "UMSocial.h"

#define MTNewFeatureNumCount  4
#define scrollW CGRectGetWidth(self.view.bounds)
#define scrollH  CGRectGetHeight(self.view.bounds)

@interface MTNewFeatureViewController ()<UIScrollViewDelegate>

@property (nonatomic, strong) UIPageControl *pageControl;

@property (nonatomic, assign) int page;


@end

@implementation MTNewFeatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self makeScrollView];
}


/**
 *  创建scrollView
 */
- (void)makeScrollView
{
    //创建滑动视图
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.frame         = self.view.bounds;
    [self.view addSubview:scrollView];
    
    scrollView.contentSize   = CGSizeMake(scrollW * MTNewFeatureNumCount, 0);
    scrollView.scrollEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.pagingEnabled = YES;
    scrollView.bounces       = NO;
    
    //实现代理，设置UIPageControl
    scrollView.delegate = self;

    //创建UIPageControl
    self.pageControl    = [self makePageControl];

    //分享按钮
    UIButton *sharaBtn = [self setLastImageVeiw:0];
    
    //开始微博
    UIButton *startBo = [self setLastImageVeiw:1];
    
    //向滑动视图中加图片
    for (int i = 0; i < MTNewFeatureNumCount; i++) {
        UIImageView *imgView = [[UIImageView alloc] init];
        imgView.frame = CGRectMake(i * scrollW, 0, scrollW, scrollH);
        
        NSString *imageName  = [NSString stringWithFormat:@"new_feature_%d",i+1];
        imgView.image        = [UIImage imageNamed:imageName];
        
        [scrollView addSubview:imgView];
        
        if (i == MTNewFeatureNumCount - 1) {
            imgView.userInteractionEnabled = YES;
            [imgView addSubview:sharaBtn];
            [imgView addSubview:startBo];
        }
    }
}

- (UIButton *)setLastImageVeiw:(NSInteger)index
{
    if (index == 0) {
        //分享按钮
        UIButton *shareBtn       = [UIButton buttonWithType:UIButtonTypeCustom];
        shareBtn.frame           = CGRectMake( 0, scrollH * 0.65, 200, 30);
        shareBtn.centerX         = scrollW * 0.5;
        [shareBtn setImage:[UIImage imageNamed:@"new_feature_share_false"] forState:UIControlStateNormal];
        [shareBtn setImage:[UIImage imageNamed:@"new_feature_share_true"] forState:UIControlStateSelected];
        [shareBtn setTitle:@"分享给大家" forState:UIControlStateNormal];
        shareBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [shareBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        shareBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
//        shareBtn.backgroundColor = [UIColor redColor];
        
        [shareBtn addTarget:self action:@selector(clickShareBtn:) forControlEvents:UIControlEventTouchUpInside];
        
        return shareBtn;
        
    }else {
        
        UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        loginBtn.frame = CGRectMake(0, scrollH * 0.65 + 35, 120, 30);
        
        loginBtn.centerX = scrollW * 0.5 + 10;
        [loginBtn setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button"] forState:UIControlStateNormal];
        loginBtn.size = loginBtn.currentBackgroundImage.size;
        [loginBtn setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button_highlighted"] forState:UIControlStateHighlighted];
        [loginBtn setTitle:@"开始微博" forState:UIControlStateNormal];
        [loginBtn addTarget:self action:@selector(clickLogin:) forControlEvents:UIControlEventTouchUpInside];
        
        return  loginBtn;
    }
}

- (void)clickShareBtn:(UIButton *)shareBtn
{
    shareBtn.selected = !shareBtn.selected;
}

- (void)clickLogin:(UIButton *)Btn
{
    UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToSina];
    
    snsPlatform.loginClickHandler(self,[UMSocialControllerService defaultControllerService],YES,^(UMSocialResponseEntity *response){
        
        //          获取微博用户名、uid、token等
        
        if (response.responseCode == UMSResponseCodeSuccess) {
            
            UMSocialAccountEntity *snsAccount = [[UMSocialAccountManager socialAccountDictionary] valueForKey:UMShareToSina];
            
            NSLog(@"username is %@, uid is %@, token is %@ url is %@",snsAccount.userName,snsAccount.usid,snsAccount.accessToken,snsAccount.iconURL);
            
        }});
    
    
}

/**
 *  创建一个PageControl
 *
 *  @return PageControl
 */
- (UIPageControl *)makePageControl
{
    UIPageControl *pageControl = [[UIPageControl alloc] init];
    pageControl.numberOfPages  = MTNewFeatureNumCount;
    pageControl.currentPageIndicatorTintColor = MTColor(253, 98, 42);
    pageControl.pageIndicatorTintColor        = MTColor(189, 189, 189);
    pageControl.centerX        = scrollW / 2;
    pageControl.centerY        = scrollH - 50;
    
    [self.view addSubview:pageControl];
    
    return pageControl;
}


/**
 *  计算当前移动到的页面
 *
 *  @param scrollView
 */
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //计算当前页：
    int page = (int)(scrollView.contentOffset.x / scrollW + 0.5);
    //四舍五入
    self.pageControl.currentPage = page;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
