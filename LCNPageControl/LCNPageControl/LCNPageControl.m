//
//  LCNPageControl.m
//  LCNPageControl
//
//  Created by 梁川楠 on 2019/4/22.
//  Copyright © 2019 梁川楠. All rights reserved.
//

#import "LCNPageControl.h"
#import "LCNPageControlCell.h"
#import "Masonry.h"

@interface LCNPageControl ()

@property (nonatomic, assign) BOOL isChangeSize;

@end

@implementation LCNPageControl

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = NO;
        
        self.showsVerticalScrollIndicator = NO;
        self.showsHorizontalScrollIndicator = NO;
        
    }
    return self;
}

- (void)setNumberOfPages:(NSInteger)numberOfPages {
    
    _numberOfPages = numberOfPages;
    
    [[self subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    LCNPageControlCell *preView = nil;
    CGFloat margin = 4;
    
    self.isChangeSize = numberOfPages > 5;
    NSMutableArray *viewArrM = [NSMutableArray array];
    for (NSInteger i = 0; i < numberOfPages; i++) {
        
        LCNPageControlCell *blackView = [[LCNPageControlCell alloc] init];
        [self addSubview:blackView];
        [viewArrM addObject:blackView];
        
        if (i == self.currentPage) {
            blackView.selected = YES;
        } else {
            blackView.selected = NO;
        }
        
        // 约束条件
        if (!preView) {
            [blackView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(5);
                make.centerY.mas_equalTo(0);
                make.width.height.mas_equalTo(6);
            }];
            
        } else if (i == numberOfPages - 1) {
            [blackView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(preView.mas_right).offset(margin);
                make.centerY.mas_equalTo(0);
                make.right.mas_equalTo(-5);
                make.width.height.mas_equalTo(6);
            }];
        } else {
            [blackView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(preView.mas_right).offset(margin);
                make.centerY.mas_equalTo(0);
                make.width.height.mas_equalTo(6);;
            }];
        }
        
        if (self.isChangeSize) {
            
            if (abs((int)(i - self.currentPage)) > 3) {
                blackView.selectWidth = 2;
            } else if (abs((int)(i - self.currentPage)) > 2) {
                blackView.selectWidth = 4;
            }
        }
        
        preView = blackView;
    }
    [self layoutIfNeeded];
}

- (void)setCurrentPage:(NSInteger)currentPage{
    
    _currentPage = currentPage;
    
    if (currentPage >= self.numberOfPages) {
        return;
    }
    
    [self.subviews enumerateObjectsUsingBlock:^(__kindof LCNPageControlCell * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if (![obj isKindOfClass:[LCNPageControlCell class]]) {
            return;
        }
        
        if (idx == currentPage) {
            obj.selected = YES;
        } else {
            obj.selected = NO;
        }
        
        if (!self.isChangeSize) {
            return ;
        }
        
        NSInteger value = abs((int)(idx - currentPage));
        
        if (currentPage <= 1 || currentPage >= self.numberOfPages - 2) {
            
            if (value > 3) {
                obj.selectWidth = 2;
            } else if (value > 2) {
                obj.selectWidth = 4;
            } else {
                obj.selectWidth = 6;
            }
            
        } else {
            
            if (value >= 3) {
                obj.selectWidth = 2;
            } else if (value == 2) {
                obj.selectWidth = 4;
            } else {
                obj.selectWidth = 6;
            }
        }
    }];
    
    if (self.contentSize.width > self.bounds.size.width && self.subviews.count > currentPage && self.isChangeSize) {
        
        UIView *view = self.subviews[currentPage];
        
        CGFloat centerX = view.center.x;
        CGFloat x = 0;
        
        if (centerX < self.bounds.size.width / 2) {
            x = 0;
        } else if (centerX >= self.bounds.size.width / 2 && centerX < (self.contentSize.width - self.bounds.size.width / 2)) {
            x = centerX - self.bounds.size.width / 2;
        } else if (centerX > (self.contentSize.width - 10)) {
            x = self.contentSize.width - self.bounds.size.width + 10;
        } else {
            x = self.contentSize.width - self.bounds.size.width;
        }
        
        if (self.contentOffset.x == x) {
            return;
        }
        [UIView animateWithDuration:0.25 animations:^{
            
            [self setContentOffset:CGPointMake(x, 0)];
            
        } completion:nil];
    }
}


@end
