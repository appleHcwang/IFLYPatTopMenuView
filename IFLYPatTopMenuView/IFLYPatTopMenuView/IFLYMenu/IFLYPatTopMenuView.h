//
//  IFLYPatTopMenuView.h
//  TextViewDemo
//
//  Created by admin on 2018/12/17.
//  Copyright © 2018年 dasdom. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol IFLYPatTopMenuViewDelegate <NSObject>
- (void)selectMenuBtn:(UIButton *)sender seleIndex:(NSInteger)selectindex;
@end
NS_ASSUME_NONNULL_BEGIN
@interface IFLYPatTopMenuView : UIView
@property (nonatomic,weak)id<IFLYPatTopMenuViewDelegate>delegate;
- (instancetype)initWithFrame:(CGRect)frame titleArray:(NSArray *)titleArray;
@end

NS_ASSUME_NONNULL_END
