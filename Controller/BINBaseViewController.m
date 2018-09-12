//
//  BINNetworkManager.m
//  高仿映客
//
//  Created by 梦想 on 2016/11/12.
//  Copyright © 2016年 lin_tong. All rights reserved.
//

#import "BINBaseViewController.h"

@interface BINBaseViewController ()

@end

@implementation BINBaseViewController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"当前视图控制器 %@", NSStringFromClass([self class]));
}

#pragma mark =============== <animation--push/pop> ===============
- (void) pushAnimation:(UIViewController *)toVC  duration:(NSTimeInterval)duration{
    
    NSTimeInterval timeIntnterval;
    if (duration) {
        timeIntnterval = duration;
    } else {
        timeIntnterval = 0.5;
    }
    [UIView  beginAnimations:nil context:NULL];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:timeIntnterval];
    [self.navigationController pushViewController:toVC animated:NO];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.navigationController.view cache:NO];
    [UIView commitAnimations];
}

- (void) popAniationwithDuration:(NSTimeInterval)duration{
    
    NSTimeInterval timeIntnterval;
    if (duration) {
        timeIntnterval = duration;
    } else {
        timeIntnterval = 0.5;
    }
    [UIView  beginAnimations:nil context:NULL];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:timeIntnterval];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.navigationController.view cache:NO];
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelay:0.375];
    [self.navigationController popViewControllerAnimated:NO];
    [UIView commitAnimations];
}

@end
