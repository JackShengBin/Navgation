//
//  UIView+Extension.h
//  yct
//
//  Created by 林_同 on 2018/1/4.
//  Copyright © 2018年 林_同. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kScreenW [UIScreen mainScreen].bounds.size.width
#define kScreenH [UIScreen mainScreen].bounds.size.height

#define kNumFrom375(a) (kScreenW/375 * a)
#define font375(num) [UIFont systemFontOfSize:kNumFrom375(num)]

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

/**
 设置圆角
 */
- (void)lt_cornerRadius:(CGFloat)radius;
/**
 设置边框及颜色
 */
- (void)lt_borderWidth:(CGFloat)width color:(UIColor *)color;
/**
 绘制圆形icon
 */
- (UIImage *)createCornerRadiusWithImage:(UIImage *)image;

//设置部分圆角
- (void)addRoundedCorners:(UIRectCorner)corners
                withRadii:(CGSize)radii
                 viewRect:(CGRect)rect;

- (void)addRoundedCorners:(UIRectCorner)corners
                withRadii:(CGSize)radii;
/**
 移除所有子控件
 */
- (void)lt_removeAllSubViews;
@end
