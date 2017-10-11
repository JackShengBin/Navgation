
//
//  SingleDemo.m
//  传值
//
//  Created by 林_同 on 2017/7/25.
//  Copyright © 2017年 林_同. All rights reserved.
//

#import "SingleDemo.h"

@interface SingleDemo (){
    NSString *_myStr;
}

@property (nonatomic, strong) NSString *str;

@end

@implementation SingleDemo

static SingleDemo *shareDemo;

+ (instancetype) shareInstance{
    static dispatch_once_t onceToken ;
    dispatch_once(&onceToken, ^{
        shareDemo = [[super allocWithZone:NULL] init];
    }) ;
    return shareDemo ;
}

+ (id)allocWithZone:(struct _NSZone *)zone{
    return [SingleDemo shareInstance] ;
}

- (id)copyWithZone:(struct _NSZone *)zone{
    return [SingleDemo shareInstance] ;
}

@end
