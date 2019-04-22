//
//  LCNPageControlCell.h
//  LCNPageControl
//
//  Created by 梁川楠 on 2019/4/22.
//  Copyright © 2019 梁川楠. All rights reserved.
//

#import <UIKit/UIKit.h>

#define RGBA(x,y,z,a) [UIColor colorWithRed:x/255.0 green:y/255.0 blue:z/255.0 alpha:a / 100.0]

NS_ASSUME_NONNULL_BEGIN

@interface LCNPageControlCell : UIView

@property (nonatomic, strong) UIColor *normalColor;
@property (nonatomic, strong) UIColor *selectColor;

@property (nonatomic, assign) BOOL selected;

@property (nonatomic, assign) CGFloat selectWidth;

@end

NS_ASSUME_NONNULL_END
