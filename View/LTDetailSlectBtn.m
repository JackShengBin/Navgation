//
//  LTDetailSlectBtn.m
//  yct
//
//  Created by 林_同 on 2018/2/22.
//  Copyright © 2018年 林_同. All rights reserved.
//

#import "LTDetailSlectBtn.h"

@interface LTDetailSlectBtn()

@property (nonatomic, strong) UILabel *line;

@end


@implementation LTDetailSlectBtn

+ (instancetype)detailBtnTitle:(NSString *)title subTitle:(NSString *)subTitle rightImage:(UIImage *)image{
    LTDetailSlectBtn *btn = [LTDetailSlectBtn new];
    btn.title.text = title;
    btn.subLabel.text = subTitle;
    btn.rightView.image = image?:[UIImage imageNamed:@"right"];
    return btn;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        _hidenLine = NO;
        [self createView];
    }
    return self;
}

- (void)setHidenLine:(BOOL)hidenLine{
    _hidenLine = hidenLine;
    _line.hidden = hidenLine;
}

#pragma mark----<#  #>
- (void)createView{
    _title = [UILabel new];
    _subLabel = [UILabel new];
    _rightView = [UIImageView new];
    _line = [UILabel new];
    
    _subLabel.font = [UIFont systemFontOfSize:14];
    _subLabel.textColor = [UIColor lightGrayColor];
    _subLabel.textAlignment = NSTextAlignmentRight;
    _line.backgroundColor = [UIColor lightGrayColor];
    
    [self lt_addSubviews:@[_title, _subLabel, _rightView, _line]];
    [self updateFrame];
}

- (void)updateFrame{
    
    [_title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(self.mas_left).with.offset(10);
    }];
    [_rightView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.right.equalTo(self).with.offset(-10);
        make.size.mas_equalTo(CGSizeMake(10, 20));
    }];
    [_subLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.height.equalTo(self);
        make.right.equalTo(_rightView.mas_left).with.offset(-10);
    }];
    [_line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self);
        make.height.mas_equalTo(1);
    }];
}

@end
