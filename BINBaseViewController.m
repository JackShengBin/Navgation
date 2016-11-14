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


- (void)appearHUDWithContent:(NSString *)content {
    _HUD = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    _HUD.label.text = content;
    _HUD.label.textColor = [UIColor whiteColor];
    _HUD.bezelView.color = [UIColor grayColor];
    _HUD.userInteractionEnabled = NO;
    [_HUD showAnimated:YES];
}

- (void)hideHUD {
    [_HUD hideAnimated:YES];
}

- (void)addTimeIntervalWithManager:(AFHTTPSessionManager *)manager {
    [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    manager.requestSerializer.timeoutInterval = 10.0f;
    [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
}

- (void)alertOfOverRun {
    NSLog(@"您的网络好像有点问题");
}

#pragma mark =============== 网络请求 ===============
- (void) get:(NSString *)urlStr andPara:(NSDictionary *)paraDic andHudStr:(NSString *)hudStr succeed:(void (^)(NSURLSessionDataTask *, id))success failed:(void (^)(NSURLSessionDataTask *, NSError *))fail {
    UIApplication *app = [UIApplication sharedApplication];
    app.networkActivityIndicatorVisible = YES;
    if (hudStr != nil) {
        [self appearHUDWithContent:hudStr];
    }
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    manager.requestSerializer.timeoutInterval = 10.0f;
    [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    
    [manager GET:urlStr parameters:paraDic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self hideHUD];
        app.networkActivityIndicatorVisible = NO;
        success(task,responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self hideHUD];
        app.networkActivityIndicatorVisible = NO;
        [self alertOfOverRun];
        fail(task,error);
    }];
}

- (void) post:(NSString *)urlStr andPara:(NSDictionary *)paraDic andHudStr:(NSString *)hudStr succeed:(void (^)(NSURLSessionDataTask *, id))success failed:(void (^)(NSURLSessionDataTask *, NSError *))fail {
    if (hudStr != nil) {
        [self appearHUDWithContent:hudStr];
    }
    UIApplication *app = [UIApplication sharedApplication];
    app.networkActivityIndicatorVisible = YES;
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    manager.requestSerializer.timeoutInterval = 10.0f;
    [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    
    [manager POST:urlStr parameters:paraDic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self hideHUD];
        app.networkActivityIndicatorVisible = NO;
        success(task,responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [self hideHUD];
        [self alertOfOverRun];
        app.networkActivityIndicatorVisible = NO;
        fail(task,error);
    }];
}


#pragma mark =============== Life Circle ===============

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}

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
