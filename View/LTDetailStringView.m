//
//  LTDetailStringView.m
//  yct
//
//  Created by 林_同 on 2018/2/23.
//  Copyright © 2018年 林_同. All rights reserved.
//

#import "LTDetailStringView.h"
#import <IQKeyboardManager.h>
@interface LTDetailStringView(){
    UILabel *_line;
}

@end

@implementation LTDetailStringView

+ (instancetype)detailStringViewTitle:(NSString *)title subText:(NSString *)subText{
    LTDetailStringView *detail = [LTDetailStringView new];
    detail.titleLabel.text = title;
    if (subText.length > 0) {
        detail.subText.text = subText;
    }
    
    return detail;
}

+ (instancetype)detailStringViewTitle:(NSString *)title subText:(NSString *)subText placeHolder:(NSString *)placeHolder{
    LTDetailStringView *detail = [LTDetailStringView new];
    detail.titleLabel.text = title;
    detail.subText.placeholder = placeHolder;
    if (subText.length > 0) {
        detail.subText.text = subText;
    }
    
    return detail;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self createView];
    }
    return self;
}

#pragma mark----<#  #>
- (void)createView{
    [IQKeyboardManager sharedManager].shouldResignOnTouchOutside = YES;
    _titleLabel = [UILabel new];
    _subText = [UITextField new];
    _line = [UILabel new];
    _titleLabel.textColor = [UIColor firstTextColor];
    _subText.textAlignment = NSTextAlignmentRight;
    _line.backgroundColor = [UIColor lineColor];
    [self lt_addSubviews:@[_titleLabel, _subText, _line]];
    [self updateFrame];
}

- (void)updateFrame{
    CGFloat margin = 10;
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(self).with.offset(margin);
        make.width.mas_equalTo(kNumFrom750(200));
    }];
    [_subText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.right.equalTo(self.mas_right).with.offset(-margin);
        make.left.lessThanOrEqualTo(_titleLabel.mas_right).with.offset(margin);
    }];
    [_line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.bottom.equalTo(self);
        make.left.equalTo(self).with.offset(kNumFrom750(30));
        make.height.mas_equalTo(kNumFrom750(1));
    }];
}

@end
