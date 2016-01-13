//
//  UIView+Extension.m
//  BoChat
//
//  Created by pani on 15/12/3.
//  Copyright © 2015年 pani. All rights reserved.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)

#pragma mark --setter

-(void)setX:(CGFloat)x
{
    CGRect frame   = self.frame;
    frame.origin.x = x;
    self.frame     = frame;
}

-(void)setY:(CGFloat)y
{
    CGRect frame   = self.frame;
    frame.origin.y = y;
    self.frame     = frame;
}

-(void)setWidth:(CGFloat)width
{
    CGRect frame     = self.frame;
    frame.size.width = width;
    self.frame       = frame;
}

-(void)setHeight:(CGFloat)height
{
    CGRect frame      = self.frame;
    frame.size.height = height;
    self.frame        = frame;
}

-(void)setOrigin:(CGPoint)origin
{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame   = frame;
}

-(void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size   = size;
    self.frame   = frame;
}

- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x       = centerX;
    self.center    = center;
}

- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y       = centerY;
    self.center    = center;
}

#pragma mark -- getter

-(CGFloat)centerX
{
    return self.centerX;
}

-(CGFloat)centerY
{
    return self.centerY;
}

-(CGFloat)x
{
    return self.frame.origin.x;
}

-(CGFloat)y
{
    return self.frame.origin.y;
}

-(CGFloat)width
{
    return self.frame.size.width;
}

-(CGFloat)height
{
    return self.frame.size.height;
}

-(CGSize)size
{
    return self.frame.size;
}

-(CGPoint)origin
{
    return self.frame.origin;
}






@end
