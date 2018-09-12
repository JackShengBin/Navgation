//
//  LTHudTool.m
//  ios_wisher
//
//  Created by ZhiFan on 2018/9/12.
//  Copyright © 2018年 lin-tong. All rights reserved.
//

#import "LTHudTool.h"
#import <UIView+Toast.h>
@implementation LTHudTool

+ (void)showWithStatus:(NSString *)status{
    [super showWithStatus:status];
}

+ (void)lt_makeTostInView:(UIView *)view position:(ToastPosition)position text:(NSString *)text duration:(CGFloat)duration{
    [self toastInView:view position:position text:text duration:duration];
}

+ (void)lt_makeTostInView:(UIView *)view text:(NSString *)text{
    [self toastInView:view position:ToastPositionCenter text:text duration:2.0f];
}

+ (void) toastInView:(UIView *)view position:(ToastPosition)position text:(NSString *)text duration:(CGFloat)duration{
    id PositionString;
    switch (position) {
        case ToastPositionTop:
            PositionString = CSToastPositionTop;
            break;
        case ToastPositionCenter:
            PositionString = CSToastPositionCenter;
            break;
        case ToastPositionBottom:
            PositionString = CSToastPositionBottom;
            break;
            
        default:
            break;
    }
    [view makeToast:text duration:duration position:PositionString];
}

#pragma mark - Block
+ (void)load{
    [LTHudTool setDefaultStyle:SVProgressHUDStyleDark];
    [LTHudTool setMinimumDismissTimeInterval:1.5f];
    //    [LTHudTool setBackgroundColor:RGBColor(0, 0, 0, 0.8)];
    //    [LTHudTool setForegroundColor:[UIColor whiteColor]];
    //    [LTHudTool setDefaultMaskType:SVProgressHUDMaskTypeGradient];
    //    [LTHudTool setInfoImage:nil];
}

void ShowHUD(void) {
    if (![NSThread isMainThread]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [LTHudTool show];
        });
    } else {
        [LTHudTool show];
    }
}

void ShowSuccessStatus(NSString *statues){
    if (![NSThread isMainThread]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [LTHudTool showSuccessWithStatus:statues];
        });
    }else{
        [LTHudTool showSuccessWithStatus:statues];
    }
}


void ShowMessage(NSString *statues){
    if (![NSThread isMainThread]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [LTHudTool showInfoWithStatus:statues];
        });
    }else{
        [LTHudTool showInfoWithStatus:statues];
    }
}

void ShowErrorStatus(NSError *error){
    NSString *statues;
    if (error.code == 100000) {
        statues = error.localizedDescription;
    } else {
        if (error.code == -1001) {
            statues = @"连接超时";
        } else {
            statues = NetError;
        }
    }
    if (![NSThread isMainThread]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [LTHudTool showErrorWithStatus:statues];
        });
    }else{
        [LTHudTool showErrorWithStatus:statues];
    }
}


void ShowMaskStatus(NSString *statues){
    if (![NSThread isMainThread]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [LTHudTool showWithStatus:statues];
        });
    }else{
        [LTHudTool showWithStatus:statues];
    }
}

void ShowProgress(CGFloat progress){
    if (![NSThread isMainThread]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [LTHudTool showProgress:progress];
        });
    }else{
        [LTHudTool showProgress:progress];
    }
}

void DismissHud(void){
    if (![NSThread isMainThread]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [LTHudTool dismiss];
        });
    }else{
        [LTHudTool dismiss];
    }
}


@end
