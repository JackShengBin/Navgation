//
//  LTHudTool.h
//  ios_wisher
//
//  Created by ZhiFan on 2018/9/12.
//  Copyright © 2018年 lin-tong. All rights reserved.
//

#import "SVProgressHUD.h"
#import <Foundation/Foundation.h>
#import <AssetsLibrary/AssetsLibrary.h>
#define Loading @"加载中..."
#define NetError @"网络连接失败!"


typedef enum : NSUInteger {
    ToastPositionTop,
    ToastPositionCenter,
    ToastPositionBottom,
} ToastPosition;

@interface LTHudTool : SVProgressHUD

// tosat提示
+ (void) lt_makeTostInView:(UIView *)view position:(ToastPosition)position text:(NSString *)text duration:(CGFloat)duration;
+ (void) lt_makeTostInView:(UIView *)view text:(NSString *)text;

extern void ShowHUD(void);
extern void ShowSuccessStatus(NSString *statues);
extern void ShowErrorStatus(NSError *error);
extern void ShowMaskStatus(NSString *statues);
extern void ShowMessage(NSString *statues);
extern void ShowProgress(CGFloat progress);
extern void DismissHud(void);
@end
