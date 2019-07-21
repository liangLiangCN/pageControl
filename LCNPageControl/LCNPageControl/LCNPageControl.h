//
//  LCNPageControl.h
//  LCNPageControl
//
//  Created by 梁川楠 on 2019/4/22.
//  Copyright © 2019 梁川楠. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LCNPageControl : UIScrollView

@property (nonatomic, assign) NSInteger numberOfPages;
@property (nonatomic, assign) NSInteger currentPage;

/** 当numberOfPages < minChangeCount 时 不改变每个圆点的大小 默认为5 */
@property (nonatomic, assign) NSInteger minChangeCount;

@end

NS_ASSUME_NONNULL_END
