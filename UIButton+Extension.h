//
//  UIButton+Extension.h
//  TestTab
//
//  Created by 林_同 on 2018/1/29.
//  Copyright © 2018年 林_同. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Extension)
//获取验证码
- (void)getCodeWithInterVale:(NSUInteger)interval EndTitle:(NSString *)endTitle;
@end
