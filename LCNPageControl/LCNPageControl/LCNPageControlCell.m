//
//  LCNPageControlCell.m
//  LCNPageControl
//
//  Created by 梁川楠 on 2019/4/22.
//  Copyright © 2019 梁川楠. All rights reserved.
//

#import "LCNPageControlCell.h"
#import "Masonry.h"

@interface LCNPageControlCell ()

@property (nonatomic, strong) UIView *blackView;

@end

@implementation LCNPageControlCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.blackView = [[UIView alloc] init];
        self.blackView.layer.cornerRadius = 3;
        //        self.blackView.frame = CGRectMake(0, 0, 6, 6);
        [self addSubview:self.blackView];
        [self.blackView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.mas_equalTo(0);
            make.width.height.mas_equalTo(6);
        }];
    }
    return self;
}

- (void)setSelectWidth:(CGFloat)selectWidth {
    _selectWidth = selectWidth;
    
    [UIView animateWithDuration:0.25 animations:^{
        [self.blackView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.height.mas_equalTo(selectWidth);
        }];
        [self.blackView.superview layoutIfNeeded];
    }];
    
    self.blackView.layer.cornerRadius = selectWidth / 2;
}

- (void)setSelected:(BOOL)selected {
    _selected = selected;
    
    if (selected) {
        self.blackView.backgroundColor = self.selectColor;
    } else {
        self.blackView.backgroundColor = self.normalColor;
    }
}

- (UIColor *)normalColor {
    if (!_normalColor) {
        _normalColor = RGBA(0, 0, 0, 15);
    }
    return _normalColor;
}

- (UIColor *)selectColor {
    if (!_selectColor) {
        _selectColor = RGBA(0, 0, 0, 80);
    }
    return _selectColor;
}

@end
