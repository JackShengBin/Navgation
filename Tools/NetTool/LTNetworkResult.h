//
//  LTNetworkResult.h
//  ios_wisher
//
//  Created by ZhiFan on 2018/9/11.
//  Copyright © 2018年 lin-tong. All rights reserved.
//

#import "LTBaseModel.h"

@interface LTNetworkResult : LTBaseModel

typedef NS_ENUM(NSInteger, ResultType) {
    ResultTypeSuccess = 200,//请求成功
    ResultTypeError = 99998,     //网络请求异常
    
};

//请求回来的消息
@property (nonatomic, copy) NSString *code;
@property (nonatomic, copy) NSString *msg;
@property (nonatomic, copy) id data;

+ (LTNetworkResult *)lt_setValuesForKeysWithJSON:(id)json;

- (void)clarifyResultWithStatus1:(void(^)(void))success status0:(void(^)(void))failed otherCallBack:(void(^)(NSInteger code))otherCallBack;

@end
