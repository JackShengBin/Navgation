//
//  UIView+CornerRadio.m
//  CornerRadiusTest
//
//  Created by 梦想 on 2016/11/21.
//  Copyright © 2016年 lin_tong. All rights reserved.
//

#import "UIView+CornerRadio.h"

@implementation UIView (CornerRadio)



- (UIImage *)createCornerRadiusWithImage:(UIImage *)image{
    
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0.0);
    //获取上下文
    CGContextRef ref = UIGraphicsGetCurrentContext();
    //画圆
    CGRect rect = CGRectMake(0, 0, image.size.width, image.size.height);
    CGContextAddEllipseInRect(ref, rect);
    //裁剪
    CGContextClip(ref);
    //画到圆上
    [image drawInRect:rect];
    
    UIImage *icon = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return icon;
}

@end
