//
//  LTDirectionBtn.m
//  AntFarms
//
//  Created by 全速 on 2018/6/2.
//  Copyright © 2018年 MuXi. All rights reserved.
//

#import "LTDirectionBtn.h"

@interface LTDirectionBtn ()
@property (nonatomic, assign) int btnType;
@property (nonatomic, assign) CGFloat margin;
@end

@implementation LTDirectionBtn

+ (LTDirectionBtn *)directionBtnWithType:(DirectionBtnType)type margin:(CGFloat)margin{
    LTDirectionBtn *btn = [LTDirectionBtn new];
    btn.btnType = type;
    btn.margin = margin;
    return btn;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    CGSize imageSize = self.imageView.size;
    CGSize labelSize = self.titleLabel.size;
    
    CGFloat left_orginX = (self.width - imageSize.width - labelSize.width)/2.f;
    CGFloat left_imageY = (self.height - imageSize.height)/2;
    CGFloat left_labelY = (self.height - labelSize.height)/2;
    
    CGFloat top_orginnY = (self.height - imageSize.height - labelSize.height)/2.f;
    CGFloat top_imageX = (self.width - imageSize.width)/2.f;
    CGFloat top_labelX = (self.width - labelSize.width)/2.f;
    
    switch (self.btnType) {
        case DirectionBtnTypeLeft:{
            self.imageView.frame = CGRectMake(left_orginX, left_imageY, imageSize.width, imageSize.height);
            self.titleLabel.frame = CGRectMake(CGRectGetMaxX(self.imageView.frame)+self.margin, left_labelY, labelSize.width, labelSize.height);
        }
            break;
        case DirectionBtnTypeRight:{
            self.titleLabel.frame = CGRectMake(left_orginX, left_labelY,  labelSize.width, labelSize.height);
            self.imageView.frame = CGRectMake(CGRectGetMaxX(self.titleLabel.frame)+self.margin, left_imageY, imageSize.width, imageSize.height);
        }
            break;
        case DirectionBtnTypeTop:{
            self.imageView.frame = CGRectMake(top_imageX, top_orginnY, imageSize.width, imageSize.height);
            self.titleLabel.frame = CGRectMake(top_labelX, CGRectGetMaxY(self.imageView.frame)+self.margin, labelSize.width, labelSize.height);
        }
            break;
        case DirectionBtnTypeBottom:{
            self.imageView.frame = CGRectMake(top_imageX, top_orginnY, imageSize.width, imageSize.height);
            self.titleLabel.frame = CGRectMake(top_labelX, CGRectGetMaxY(self.imageView.frame)+self.margin, labelSize.width, labelSize.height);
        }
            break;
    }
    
}


@end
