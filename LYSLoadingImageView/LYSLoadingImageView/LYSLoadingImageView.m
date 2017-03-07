//
//  LYSLoadingImageView.m
//  LYSLoadingImageView
//
//  Created by jk on 2017/3/7.
//  Copyright © 2017年 Goldcard. All rights reserved.
//

#import "LYSLoadingImageView.h"

@interface LYSLoadingImageView ()

@property(nonatomic,assign)BOOL isLoading;

@property(nonatomic,strong)UIActivityIndicatorView *indicatorView;

@end

@implementation LYSLoadingImageView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initConfig];
    }
    return self;
}

-(void)setIndicatorStyle:(UIActivityIndicatorViewStyle)indicatorStyle{
    _indicatorStyle = indicatorStyle;
    self.indicatorView.activityIndicatorViewStyle = _indicatorStyle;
}

#pragma mark - 初始化配置
-(void)initConfig{
    _indicatorStyle = UIActivityIndicatorViewStyleGray;
    self.indicatorView.activityIndicatorViewStyle = _indicatorStyle;
    [self addSubview:self.indicatorView];
    self.indicatorView.layer.borderWidth = 3;
}

#pragma mark - 开始加载
-(void)startLoading:(NSString*)imageUrl{
    if (!self.isLoading) {
        self.isLoading = YES;
        [self.indicatorView startAnimating];
        if(self.loadStart) {
           self.loadStart(self.placeHolderImage,imageUrl,self);
        }
    }
}

#pragma mark - 重写layoutSubviews方法
-(void)layoutSubviews{
    [super layoutSubviews];
    switch (self.indicatorStyle) {
        case UIActivityIndicatorViewStyleWhite:
            self.indicatorView.bounds = CGRectMake(0, 0, 20, 20);
            break;
        case UIActivityIndicatorViewStyleGray:
            self.indicatorView.bounds = CGRectMake(0, 0, 20, 20);
            break;
        case UIActivityIndicatorViewStyleWhiteLarge:
            self.indicatorView.bounds = CGRectMake(0, 0, 37, 37);
            break;
    }
    self.indicatorView.frame = CGRectMake((self.bounds.size.width - self.indicatorView.bounds.size.width)/2, (self.bounds.size.height - self.indicatorView.bounds.size.height)/2, self.indicatorView.bounds.size.width, self.indicatorView.bounds.size.height);
}

#pragma mark - 停止加载
-(void)stopLoading:(BOOL)success{
    if (self.isLoading) {
        self.isLoading = NO;
        [self.indicatorView stopAnimating];
        if(!success){
            self.image = self.failImage ?: self.placeHolderImage;
        }
    }
}

#pragma mark - 指示器
-(UIActivityIndicatorView*)indicatorView{
    if (!_indicatorView) {
        _indicatorView = [[UIActivityIndicatorView alloc]init];
        _indicatorView.hidesWhenStopped = YES;
    }
    return _indicatorView;
}

@end
