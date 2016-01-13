//
//  UIBarButtonItem+Extension.h
//  BoChat
//
//  Created by pani on 15/12/1.
//  Copyright © 2015年 pani. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)

+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action WithImage:(NSString *)imageName selectedImage:(NSString *)selecImageName;
@end
