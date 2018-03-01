//
//  LTDetailStringView.h
//  yct
//
//  Created by 林_同 on 2018/2/23.
//  Copyright © 2018年 林_同. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LTDetailStringView : UIView

//默认不能修改
@property (nonatomic, strong) UITextField *subText;

@property (nonatomic, strong) UILabel *titleLabel;

+ (instancetype)detailStringViewTitle:(NSString *)title subText:(NSString *)subText;

@end
