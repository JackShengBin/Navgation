//
//  MJLAFAppNetAPIClient.m
//  lygcwz
//
//  Created by lyscds2017 on 2018/1/19.
//  Copyright © 2018年 miaojinliang. All rights reserved.
//

#import "MJLAFAppNetAPIClient.h"
static NSString * const AFAppDotNetAPIBaseURLString = BASE_URL;

@implementation MJLAFAppNetAPIClient
+ (instancetype)sharedClient {
    static MJLAFAppNetAPIClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[MJLAFAppNetAPIClient alloc] initWithBaseURL:[NSURL URLWithString:AFAppDotNetAPIBaseURLString]];
        _sharedClient.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
        _sharedClient.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"text/plain",@"text/html",@"application/json", @"text/json", @"text/javascript",@"application/x-www-form-urlencoded", nil];
        [_sharedClient.requestSerializer willChangeValueForKey:@"timeoutInterval"];
        _sharedClient.requestSerializer.timeoutInterval=600.f;
        [_sharedClient.requestSerializer didChangeValueForKey:@"timeoutInterval"];
        [_sharedClient.reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
            //            switch (status) {
            //                case AFNetworkReachabilityStatusReachableViaWWAN:
            //                    [SVProgressHUD showInfoWithStatus:@"当前处于2G/3G/4G移动网络下"];
            //                    break;
            //
            //                case AFNetworkReachabilityStatusReachableViaWiFi:
            //                    [SVProgressHUD showInfoWithStatus:@"当前处于WiFi网络下"];
            //
            //                    break;
            //                case AFNetworkReachabilityStatusNotReachable:
            //                    [SVProgressHUD showInfoWithStatus:@"当前网络不可用"];
            //                    break;
            //                default:
            //                    break;
            //            }
        }];
        [_sharedClient.reachabilityManager startMonitoring];
    });
    if (LoginInfo) {
        [_sharedClient.requestSerializer setValue:[NSString stringWithFormat:@"Basic %@",[LoginInfo objectForKey:@"token"]] forHTTPHeaderField:@"Authorization"];
    }
    return _sharedClient;
}

@end
