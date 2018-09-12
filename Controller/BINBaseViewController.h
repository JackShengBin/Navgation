//
//  BINNetworkManager.h
//  高仿映客
//
//  Created by 梦想 on 2016/11/12.
//  Copyright © 2016年 lin_tong. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface BINBaseViewController : UIViewController

//动画跳转
- (void) pushAnimation:(UIViewController *)toVC  duration: (NSTimeInterval) duration;
- (void) popAniationwithDuration: (NSTimeInterval) duration;

@end
