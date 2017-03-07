//
//  DetailViewController.m
//  LYSLoadingImageView
//
//  Created by jk on 2017/3/7.
//  Copyright © 2017年 Goldcard. All rights reserved.
//

#import "DetailViewController.h"
#import "UIImageView+WebCache.h"
#import "LYSLoadingImageView.h"

@interface DetailViewController ()

@property(nonatomic,strong)LYSLoadingImageView *imageView;

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
            
        // Update the view.
        [self configureView];
    }
}

-(LYSLoadingImageView*)imageView{
    if (!_imageView) {
        _imageView = [[LYSLoadingImageView alloc]init];
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
        _imageView.failImage = [UIImage imageNamed:@"pay_unkown_icon"];
        _imageView.placeHolderImage = [UIImage imageNamed:@"home_banner"];
        _imageView.indicatorStyle = UIActivityIndicatorViewStyleGray;
        _imageView.frame = CGRectMake(60, 120, 120, 120);
        _imageView.layer.borderWidth = 2;
        _imageView.loadStart = ^(UIImage *placeHolderImage,NSString *imageUrl,LYSLoadingImageView *imageView){
            __weak typeof (imageView)weakImageView = imageView;
            [imageView sd_setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:placeHolderImage completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                if (error) {
                    [weakImageView stopLoading:NO];
                }else{
                    [weakImageView stopLoading:YES];
                }
            }];
        };
    }
    return _imageView;
}

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem description];
    }
    [self.view addSubview:self.imageView];
    [self.imageView startLoading:@"http://wddwdddw.ba44ddd3idu.com"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
