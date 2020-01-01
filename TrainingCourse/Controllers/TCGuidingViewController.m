//
//  TCGuidingViewController.m
//  TrainingCourse
//
//  Created by gangneng shen on 2020/1/1.
//  Copyright © 2020 gangneng shen. All rights reserved.
//

#import "TCGuidingViewController.h"
#import "TCHomeViewController.h"

@interface TCGuidingViewController () <UIScrollViewDelegate>
// Datas
@property (nonatomic, copy) NSArray *titlesArray;
@property (nonatomic, copy) NSArray *bgsArray;
// Views
@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation TCGuidingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupAttributes];
    [self setupSubViews];
    [self setupConstraints];
}

- (void)setupAttributes {
    self.view.backgroundColor = kRedColor;
    self.titlesArray = @[@"培",@"训",@"课",@"堂"];
    self.bgsArray = @[kRedColor,kMainBlueColor,kOrangeColor,kBrownColor];
}

- (void)setupSubViews {
    [self.view addSubview:self.scrollView];
    for (int i = 0; i < self.titlesArray.count; i++) {
        NSString *title = self.titlesArray[i];
        UIColor *bgColor = self.bgsArray[i];
        // 背景图
        UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(i * kScreenWidth, 0, kScreenWidth, kScreenHeight)];
        bgView.backgroundColor = bgColor;
        // 文字
        UILabel *label = [[UILabel alloc] init];
        label.text = title;
        label.textColor = kWhiteColor;
        label.textAlignment = NSTextAlignmentCenter;
        [label sizeToFit];
        [bgView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(bgView);
        }];
        if (i == self.titlesArray.count - 1) {
            // 立即体验
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.backgroundColor = kGreenColor;
            [btn setTitle:@"立即体验" forState:UIControlStateNormal];
            [btn setTitle:@"立即体验" forState:UIControlStateHighlighted];
            [btn setTitleColor:kWhiteColor forState:UIControlStateNormal];
            [btn setTitleColor:kWhiteColor forState:UIControlStateHighlighted];
            [btn addTarget:self action:@selector(seeNow:) forControlEvents:UIControlEventTouchUpInside];
            [bgView addSubview:btn];
            [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.bottom.equalTo(bgView.mas_bottom).offset(-kBottomHeight-8);
                make.centerX.equalTo(bgView.mas_centerX);
                make.width.equalTo(@100);
                make.height.equalTo(@39);
            }];
        }
        
        [self.scrollView addSubview:bgView];
    }
}

- (void)setupConstraints {
    
}

#pragma mark - Target Action
- (void)seeNow:(UIButton *)sender {
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:kHasWelcome];
    [UIApplication sharedApplication].delegate.window.rootViewController = [[TCHomeViewController alloc] init];
}

#pragma mark - Lazy Init
- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
        _scrollView.contentSize = CGSizeMake(kScreenWidth * self.titlesArray.count, kScreenHeight);
        _scrollView.delegate = self;
        _scrollView.pagingEnabled = YES;
        _scrollView.showsVerticalScrollIndicator =
        _scrollView.showsHorizontalScrollIndicator = NO;
    }
    return _scrollView;
}

@end
