//
//  LTDetailSlectBtn.h
//  yct
//
//  Created by 林_同 on 2018/2/22.
//  Copyright © 2018年 林_同. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LTDetailSlectBtn : UIButton

@property (nonatomic, strong) UILabel *title;
@property (nonatomic, strong) UILabel *subLabel;
@property (nonatomic, strong) UIImageView *rightView;

@property (nonatomic, assign) BOOL hidenLine;

+ (instancetype)customBtnTitle:(NSString *)title subTitle:(NSString *)subTitle rightImage:(UIImage *)image;

@end
