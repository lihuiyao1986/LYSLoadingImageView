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
#import "UIView+Shake.h"

@interface DetailViewController ()

@property(nonatomic,strong)LYSLoadingImageView *imageView;

@property(nonatomic,strong)UIButton *btn;

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

-(UIButton*)btn{
    if (!_btn) {
        _btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btn setTitle:@"点击" forState:UIControlStateNormal];
        [_btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        _btn.frame = CGRectMake(10, 300, self.view.frame.size.width - 20, 44);
        _btn.layer.borderColor = [UIColor greenColor].CGColor;
        _btn.layer.borderWidth = 1;
        _btn.layer.cornerRadius = 8;
        [_btn addTarget:self action:@selector(btnClicked) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btn;
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

-(void)btnClicked{
    [self.btn beginShake];
}

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem description];
    }
    [self.view addSubview:self.imageView];
    [self.imageView startLoading:@"http://wddwdddw.ba44ddd3idu.com"];
    [self.view addSubview:self.btn];
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
