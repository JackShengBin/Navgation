//
//  LTDetailStringView.m
//  yct
//
//  Created by 林_同 on 2018/2/23.
//  Copyright © 2018年 林_同. All rights reserved.
//

#import "LTDetailStringView.h"
@interface LTDetailStringView(){
    UILabel *_line;
}

@end

@implementation LTDetailStringView

+ (instancetype)detailStringViewTitle:(NSString *)title subText:(NSString *)subText{
    LTDetailStringView *detail = [LTDetailStringView new];
    detail.titleLabel.text = title;
    detail.subText.text = subText;
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
    _titleLabel = [UILabel new];
    _subText = [UITextField new];
    _line = [UILabel new];
    _subText.enabled = NO;
    _subText.textAlignment = NSTextAlignmentRight;
    _line.backgroundColor = [UIColor lightGrayColor];
    [self lt_addSubviews:@[_titleLabel, _subText, _line]];
    [self updateFrame];
}

- (void)updateFrame{
    CGFloat margin = 10;
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(self).with.offset(margin);
//        make.width.mas_lessThanOrEqualTo(200);
    }];
    [_subText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.right.equalTo(self.mas_right).with.offset(-margin);
//        make.left.lessThanOrEqualTo(_titleLabel.mas_right).with.offset(-margin);
    }];
    [_line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self);
        make.height.mas_equalTo(1);
    }];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
