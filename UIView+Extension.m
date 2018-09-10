//
//  UIView+Extension.m
//  yct
//
//  Created by 林_同 on 2018/1/4.
//  Copyright © 2018年 林_同. All rights reserved.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)

- (void)lt_cornerRadius:(CGFloat)cornerRadius{
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = cornerRadius;
}


- (UINavigationController *)getSuperViewController{
    
    for (UIView* next = [self superview]; next; next = next.superview) {
        
        UIResponder *nextResponder = [next nextResponder];
        
        if ([nextResponder isKindOfClass:[UINavigationController class]]) {
            return (UINavigationController *)nextResponder;
        }
    }
    return nil;
}

- (void)lt_addSubviews:(NSArray<UIView *> *)subviews{
    [subviews enumerateObjectsUsingBlock:^(UIView *view, NSUInteger idx, BOOL *stop) {
        if ([view isKindOfClass:[UIView class]]) {
            [self addSubview:view];
        }
    }];
}

- (void)lt_backgroundViewkColor:(NSArray<UIView *> *)subviews{
    [subviews enumerateObjectsUsingBlock:^(UIView *view, NSUInteger idx, BOOL *stop) {
        if ([view isKindOfClass:[UIView class]]) {
            view.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255.0)/255.0 green:arc4random_uniform(255.0)/255.0 blue:arc4random_uniform(255.0)/255.0 alpha:1];
        }
    }];
}

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

- (void)setLt_w:(CGFloat)lt_w{
    CGRect frame = self.frame;
    frame.size.width = lt_w;
    self.frame = frame;
}

- (void)setLt_h:(CGFloat)lt_h{
    CGRect frame = self.frame;
    frame.size.height = lt_h;
    self.frame = frame;
}

- (void)setLt_x:(CGFloat)lt_x{
    CGRect frame = self.frame;
    frame.origin.x = lt_x;
    self.frame = frame;
}

- (void)setLt_y:(CGFloat)lt_y{
    CGRect frame = self.frame;
    frame.origin.y = lt_y;
    self.frame = frame;
}

- (void)setLt_frame:(CGRect)lt_frame{
    self.frame = lt_frame;
}

- (void)setLt_size:(CGSize)lt_size{
    CGRect frame = self.frame;
    frame.size = lt_size;
    self.frame = frame;
}

- (void)setLt_origin:(CGPoint)lt_origin{
    CGRect frame = self.frame;
    frame.origin = lt_origin;
    self.frame = frame;
}

- (CGFloat)lt_w{
    return self.frame.size.width;
}

- (CGFloat)lt_h{
    return self.frame.size.height;
}

- (CGFloat)lt_x{
    return self.frame.origin.x;
}

- (CGFloat)lt_y{
    return self.frame.origin.y;
}

- (CGRect)lt_frame{
    return self.frame;
}

- (CGPoint)lt_origin{
    return self.frame.origin;
}

- (CGSize)lt_size{
    return self.frame.size;
}

@end
