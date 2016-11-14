//
//  BINNetworkManager.h
//  高仿映客
//
//  Created by 梦想 on 2016/11/12.
//  Copyright © 2016年 lin_tong. All rights reserved.
//


#import "AFNetworking.h"

/**
 *  基 
 */
@interface BINBaseViewController : UIViewController

@property (nonatomic, readwrite, copy) MBProgressHUD *HUD;

- (void)appearHUDWithContent:(NSString *)content;
- (void)hideHUD;
- (void)addTimeIntervalWithManager:(AFHTTPSessionManager *)manager;
- (void)alertOfOverRun;

//网络请求
- (void)get:(NSString *)urlStr andPara:(NSDictionary*) paraDic andHudStr:(NSString *)hudStr succeed:(void(^)(NSURLSessionDataTask *task, id data))success failed:(void(^)(NSURLSessionDataTask *task, NSError* error))fail;
- (void)post:(NSString *)urlStr andPara:(NSDictionary*) paraDic andHudStr:(NSString *)hudStr succeed:(void(^)(NSURLSessionDataTask *task, id data))success failed:(void(^)(NSURLSessionDataTask *task, NSError* error))fail;


//动画跳转
- (void) pushAnimation:(UIViewController *)toVC  duration: (NSTimeInterval) duration;
- (void) popAniationwithDuration: (NSTimeInterval) duration;

@end
