//
//  UIView+Extension.h
//  yct
//
//  Created by 林_同 on 2018/1/4.
//  Copyright © 2018年 林_同. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extension)

@property (nonatomic, assign) CGFloat lt_h;

@property (nonatomic, assign) CGFloat lt_w;

@property (nonatomic, assign) CGFloat lt_x;

@property (nonatomic, assign) CGFloat lt_y;

@property (nonatomic, assign) CGSize lt_size;

@property (nonatomic, assign) CGRect lt_frame;

@property (nonatomic, assign) CGPoint lt_origin;


- (void)lt_addSubviews:(NSArray <UIView *>*)subviews;
- (void)lt_backgroundViewkColor:(NSArray<UIView *> *)subviews;

- (UINavigationController *)getSuperViewController;
/**
 绘制圆形icon
 */
- (UIImage *)createCornerRadiusWithImage:(UIImage *)image;

@end
