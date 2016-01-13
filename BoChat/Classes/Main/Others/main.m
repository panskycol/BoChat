//
//  main.m
//  toJSON
//
//  Created by pani on 15/11/28.
//  Copyright © 2015年 pani. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

#ifdef DEBUG    //测试模式
#define MTLog(...) NSLog(__VA_ARGS__)
#else           //在真机或别的模式下，打印无效了
#define MTLog(...)
#endif

int main(int argc, char * argv[]) {
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
    
}
