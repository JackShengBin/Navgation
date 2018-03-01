//
//  MJLAFAppNetAPIClient.h
//  lygcwz
//
//  Created by lyscds2017 on 2018/1/19.
//  Copyright © 2018年 miaojinliang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>
@interface MJLAFAppNetAPIClient : AFHTTPSessionManager
+ (instancetype)sharedClient;
@end
