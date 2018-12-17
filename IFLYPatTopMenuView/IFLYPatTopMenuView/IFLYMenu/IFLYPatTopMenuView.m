//
//  IFLYPatTopMenuView.m
//  TextViewDemo
//
//  Created by admin on 2018/12/17.
//  Copyright © 2018年 dasdom. All rights reserved.
//

#import "IFLYPatTopMenuView.h"
@interface IFLYPatTopMenuView () {
    
    
}
@property(nonatomic,strong)NSArray * titleArr;
@end
@implementation IFLYPatTopMenuView

- (instancetype)initWithFrame:(CGRect)frame titleArray:(NSArray *)titleArray {
    self = [super initWithFrame:frame];
    if (self) {
        self.titleArr = titleArray;
        [self creatView];
        self.layer.cornerRadius = CGRectGetHeight(self.frame)/2.f;
        self.layer.masksToBounds = YES;
    }
    return self;
}

- (void)creatView {
    [self.titleArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(idx * CGRectGetWidth(self.frame)/self.titleArr.count,0, CGRectGetWidth(self.frame)/self.titleArr.count, CGRectGetHeight(self.frame))];
        [btn addObserver:self forKeyPath:@"selected" options:NSKeyValueObservingOptionNew context:nil];
        [btn setTitle:obj forState:UIControlStateNormal];
        if (idx == 0) {
            btn.selected = YES;
        } else {
            btn.selected = NO;
        }
        btn.tag = 100 + idx;
        btn.layer.cornerRadius = CGRectGetHeight(self.frame)/2.f;
        btn.layer.masksToBounds = YES;
        [btn addTarget:self action:@selector(selectindexTitle:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
    }];
}

- (void)selectindexTitle:(UIButton *)sender {
    for (id classView in self.subviews) {
        if ([classView isKindOfClass:[UIButton class]]) {
            ((UIButton *)classView).selected = NO;
        }
    }
    sender.selected = YES;
    if (self.delegate && [self.delegate respondsToSelector:@selector(selectMenuBtn:seleIndex:)]) {
        [self.delegate selectMenuBtn:sender seleIndex:sender.tag - 100];
    }
    
}

//当key路径对应的属性值发生改变时，监听器就会回调自身的监听方法，如下
- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary<NSKeyValueChangeKey,id> *)change
                       context:(void *)contex {
    UIButton * btn = (UIButton *)object;
    if (btn.selected) {
        btn.backgroundColor = [UIColor redColor];
    } else {
        btn.backgroundColor = [UIColor yellowColor];
    }
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
