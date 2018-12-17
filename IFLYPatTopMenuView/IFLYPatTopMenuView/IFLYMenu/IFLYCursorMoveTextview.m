//
//  IFLYCursorMoveTextview.m
//  TextViewDemo
//
//  Created by admin on 2018/12/17.
//  Copyright © 2018年 dasdom. All rights reserved.
//

#import "IFLYCursorMoveTextview.h"
#define kCursorSpeed 1.0f/8.0f
#define maxNumber 10000000
@interface IFLYCursorMoveTextview() {
    
}
@property (nonatomic, strong) UIPanGestureRecognizer *singleFingerPan;
@property (nonatomic, assign) NSRange startRange;
@end
@implementation IFLYCursorMoveTextview
- (id)init {
    self = [super init];
    if (self) {
        _singleFingerPan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(singleFingerPanHappend:)];
        _singleFingerPan.maximumNumberOfTouches = 1;
        [self addGestureRecognizer:_singleFingerPan];
    }
    return self;
}

- (void)requireGestureRecognizerToFail:(UIGestureRecognizer*)gestureRecognizer {
    [self.singleFingerPan requireGestureRecognizerToFail:gestureRecognizer];
}

- (void)singleFingerPanHappend:(UIPanGestureRecognizer*)sender {
    if (sender.state == UIGestureRecognizerStateBegan) {
        self.startRange = self.selectedRange;
    }
    CGFloat number = self.startRange.location+(NSInteger)([sender translationInView:self].x*kCursorSpeed);
    if (number >= maxNumber) {
        return;
    }
    CGFloat cursorLocation = MAX(number, 0);
    NSRange selectedRange = {cursorLocation, 0};
    self.selectedRange = selectedRange;
}


@end
