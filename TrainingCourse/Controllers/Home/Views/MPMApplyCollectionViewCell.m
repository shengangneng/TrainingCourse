//
//  MPMApplyCollectionViewCell.m
//  TrainingCourse
//
//  Created by gangneng shen on 2020/1/1.
//  Copyright © 2020 gangneng shen. All rights reserved.
//

#import "MPMApplyCollectionViewCell.h"
#import "MPMButton.h"
#import "MPMDealingBorderButton.h"

@interface MPMApplyCollectionViewCell ()

@end

@implementation MPMApplyCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.quickLabel];
        [self.quickLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self.mas_leading).offset(10);
            make.trailing.equalTo(self.mas_trailing).offset(-10);
            make.top.equalTo(self.mas_top);
            make.bottom.equalTo(self.mas_bottom).offset(-15);
        }];
    }
    return self;
}

- (void)setBorderColor:(UIColor *)borderColor {
    _borderColor = borderColor;
    if (!borderColor) {
        _borderColor = kWhiteColor;
    }
    self.quickLabel.layer.borderColor = _borderColor.CGColor;
}

#pragma mark - Lazy Init
- (UILabel *)quickLabel {
    if (!_quickLabel) {
        _quickLabel = [[UILabel alloc] init];
        _quickLabel.textColor = kRGBA(255, 249, 240, 1);
        _quickLabel.font = SystemFont(13);
        _quickLabel.text = @"上午";
        _quickLabel.textAlignment = NSTextAlignmentCenter;
        _quickLabel.layer.cornerRadius = 12.5;
        _quickLabel.layer.borderWidth = 1;
    }
    return _quickLabel;
}

@end
