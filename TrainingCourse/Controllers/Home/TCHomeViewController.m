//
//  TCHomeViewController.m
//  TrainingCourse
//
//  Created by gangneng shen on 2020/1/1.
//  Copyright © 2020 gangneng shen. All rights reserved.
//

#import "TCHomeViewController.h"

@interface TCHomeViewController ()
// Header
@property (nonatomic, strong) UIView *headerView;
@property (nonatomic, strong) UILabel *headerTitleLabel;      /** 培训课堂V2 */
@property (nonatomic, strong) UIButton *headerGoldButton;     /** 开通VIP会员 */
@property (nonatomic, strong) UIView *headerSeperatorView;    /** 分割线 */
@property (nonatomic, strong) UIButton *headerSearchButton;   /** 请输入关键字查找 */

@end

@implementation TCHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupAttributes];
    [self setupSubViews];
    [self setupConstraints];
}

- (void)setupAttributes {
    self.view.backgroundColor = kCommomBackgroundColor;
    self.navigationItem.title = @"首页";
    [self.headerSearchButton addTarget:self action:@selector(homgSearch:) forControlEvents:UIControlEventTouchUpInside];
    [self.headerGoldButton addTarget:self action:@selector(joinVIP:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)setupSubViews {
    // Header
    [self.view addSubview:self.headerView];
    [self.headerView addSubview:self.headerTitleLabel];
    [self.headerView addSubview:self.headerGoldButton];
    [self.headerView addSubview:self.headerSeperatorView];
    [self.headerView addSubview:self.headerSearchButton];
}

- (void)setupConstraints {
    [self.headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.top.trailing.equalTo(self.view);
    }];
    [self.headerTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.headerView.mas_leading).offset(12);
        make.centerY.equalTo(self.headerGoldButton.mas_centerY);
    }];
    [self.headerGoldButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@32);
        make.width.equalTo(@120);
        make.trailing.equalTo(self.headerView.mas_trailing).offset(-12);
        make.top.equalTo(self.headerView.mas_top).offset(12);
    }];
    [self.headerSeperatorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.equalTo(self.view);
        make.height.equalTo(@0.5);
        make.top.equalTo(self.headerGoldButton.mas_bottom).offset(12);
    }];
    [self.headerSearchButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.headerView.mas_leading).offset(12);
        make.trailing.equalTo(self.headerView.mas_trailing).offset(-12);
        make.top.equalTo(self.headerSeperatorView.mas_bottom).offset(12);
        make.height.equalTo(@39);
        make.bottom.equalTo(self.headerView.mas_bottom).offset(-12);
    }];
}

#pragma mark - Target Action
- (void)homgSearch:(UIButton *)sender {
    
}

- (void)joinVIP:(UIButton *)sender {
    
}

#pragma mark - Lazy Init
- (UIView *)headerView {
    if (!_headerView) {
        _headerView = [[UIView alloc] init];
        _headerView.backgroundColor = kWhiteColor;
    }
    return _headerView;
}
- (UILabel *)headerTitleLabel {
    if (!_headerTitleLabel) {
        _headerTitleLabel = [[UILabel alloc] init];
        [_headerTitleLabel sizeToFit];
        _headerTitleLabel.font = BoldSystemFont(19);
        _headerTitleLabel.text = @"培训课程V2";
    }
    return _headerTitleLabel;
}
- (UIButton *)headerGoldButton {
    if (!_headerGoldButton) {
        _headerGoldButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _headerGoldButton.backgroundColor = kRGBA(210, 155, 103, 1);
        _headerGoldButton.titleLabel.font = BoldSystemFont(16);
        _headerGoldButton.layer.cornerRadius = 16;
        _headerGoldButton.layer.masksToBounds = YES;
        [_headerGoldButton setTitle:@"开通VIP会员" forState:UIControlStateNormal];
        [_headerGoldButton setTitle:@"开通VIP会员" forState:UIControlStateHighlighted];
        [_headerGoldButton setTitleColor:kWhiteColor forState:UIControlStateNormal];
        [_headerGoldButton setTitleColor:kWhiteColor forState:UIControlStateHighlighted];
    }
    return _headerGoldButton;
}
- (UIView *)headerSeperatorView {
    if (!_headerSeperatorView) {
        _headerSeperatorView = [[UIView alloc] init];
        _headerSeperatorView.backgroundColor = kSeperateColor;
    }
    return _headerSeperatorView;
}
- (UIButton *)headerSearchButton {
    if (!_headerSearchButton) {
        _headerSearchButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _headerSearchButton.backgroundColor = kCommomBackgroundColor;
        _headerSearchButton.titleLabel.font = SystemFont(16);
        _headerSearchButton.layer.cornerRadius = 5;
        _headerSearchButton.layer.masksToBounds = YES;
        [_headerSearchButton setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 5)];
        [_headerSearchButton setTitle:@"请输入关键字查找" forState:UIControlStateNormal];
        [_headerSearchButton setTitle:@"请输入关键字查找" forState:UIControlStateHighlighted];
        [_headerSearchButton setTitleColor:kTextLightColor forState:UIControlStateNormal];
        [_headerSearchButton setTitleColor:kTextLightColor forState:UIControlStateHighlighted];
        [_headerSearchButton setImage:ImageName(@"com_find") forState:UIControlStateNormal];
        [_headerSearchButton setImage:ImageName(@"com_find") forState:UIControlStateHighlighted];
    }
    return _headerSearchButton;
}

@end
