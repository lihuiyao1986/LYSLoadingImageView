//
//  LYSLoadingImageView.h
//  LYSLoadingImageView
//
//  Created by jk on 2017/3/7.
//  Copyright © 2017年 Goldcard. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LYSLoadingImageView;

typedef void(^LoadStart)(UIImage *placeHolderImage,NSString *imageUrl,LYSLoadingImageView *imageView);

@interface LYSLoadingImageView : UIImageView

#pragma mark - 加载框类型
@property(nonatomic,assign)UIActivityIndicatorViewStyle indicatorStyle;

#pragma mark - 占位图片
@property(nonatomic,strong)UIImage *placeHolderImage;

#pragma mark - 加载失败的占位图片
@property(nonatomic,strong)UIImage *failImage;

#pragma mark - 加载开始
@property(nonatomic,copy)LoadStart loadStart;

#pragma mark - 开始加载
-(void)startLoading:(NSString*)imageUrl;

#pragma mark - 停止加载
-(void)stopLoading:(BOOL)success;

@end
