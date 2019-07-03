//
//  RecognizeSimultaneousTableView.m
//  YuLin
//
//  Created by 梁羽 on 2017/4/18.
//  Copyright © 2017年 zhishi. All rights reserved.
//

#import "RecognizeSimultaneousTableView.h"

@implementation RecognizeSimultaneousTableView

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    if ([otherGestureRecognizer.view isKindOfClass:[UICollectionView class]]) {
        return NO;
    }
    return YES;
}

@end
