//
//  UIButton+Extension.m
//  TestTab
//
//  Created by 林_同 on 2018/1/29.
//  Copyright © 2018年 林_同. All rights reserved.
//

#import "UIButton+Extension.h"

@implementation UIButton (Extension)

- (void)getCodeWithInterVale:(NSUInteger)interval EndTitle:(NSString *)endTitle{
    __block NSInteger time = interval;
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_global_queue(0, 0));
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 1.0 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
    dispatch_source_set_event_handler(timer, ^{
        if(time <= 0){
            dispatch_source_cancel(timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                [self setTitle:endTitle forState:UIControlStateNormal];
                self.userInteractionEnabled = YES;
            });
        }else{
            int seconds = time % 60;
            dispatch_async(dispatch_get_main_queue(), ^{
                [self setTitle:[NSString stringWithFormat:@"重新发送%2d", seconds] forState:UIControlStateNormal];
                self.userInteractionEnabled = NO;
                NSLog(@"+++++");
            });
            time--;
        }
    });
    dispatch_resume(timer);
}

@end
