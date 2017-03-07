//
//  UIView+Shake.m
//  LYSLoadingImageView
//
//  Created by jk on 2017/3/7.
//  Copyright © 2017年 Goldcard. All rights reserved.
//

#import "UIView+Shake.h"

@implementation UIView (Shake)

-(void)beginShake{
    __weak typeof (self)WeakSelf = self;
    srand([[NSDate date] timeIntervalSince1970]);
    float rand=(float)random();
    CFTimeInterval t=rand*0.0000000001;
    [UIView animateWithDuration:0.1 delay:t options:0  animations:^{
        WeakSelf.transform=CGAffineTransformMakeRotation(-0.05);
     } completion:^(BOOL finished){
         [UIView animateWithDuration:0.1 delay:0 options:UIViewAnimationOptionRepeat|UIViewAnimationOptionAutoreverse|UIViewAnimationOptionAllowUserInteraction  animations:^
          {
              WeakSelf.transform=CGAffineTransformMakeRotation(0.05);
          } completion:^(BOOL finished) {}];
     }];
}

-(void)endShake{
    __weak typeof (self)WeakSelf = self;
    [UIView animateWithDuration:0.1 delay:0 options:UIViewAnimationOptionAllowUserInteraction|UIViewAnimationOptionBeginFromCurrentState animations:^      {
        WeakSelf.transform=CGAffineTransformIdentity;
    } completion:^(BOOL finished) {}];
}

@end
