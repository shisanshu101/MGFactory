//
//  UIView+MGFrame.h
//  MGFactory
//
//  Created by 一只狗 on 2019/7/3.
//  Copyright © 2019 longdian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (MGFrame)

/**
 * frame.origin.x
 */
@property (nonatomic) CGFloat x;

/**
 * frame.origin.y
 */
@property (nonatomic) CGFloat y;

/**
 * frame.size.width;
 */
@property (nonatomic) CGFloat width;

/**
 *  frame.size.height
 */
@property (nonatomic) CGFloat height;

/**
 *  center.x
 */
@property (nonatomic) CGFloat centerX;

/**
 *  center.y
 */
@property (nonatomic) CGFloat centerY;

/**
 *  frame.origin
 */
@property (nonatomic) CGPoint origin;

/**
 *  frame.size
 */
@property (nonatomic) CGSize size;

/**
 * CGRectGetMaxX
 */
@property (nonatomic, readonly) CGFloat maxX;

/**
 *  CGRectGetMaxY
 */
@property (nonatomic, readonly) CGFloat maxY;

/**
 * frame.origin.y
 */
@property (nonatomic) CGFloat top;


@property (nonatomic) CGFloat bottom;

/**
 * frame.origin.x
 */
@property (nonatomic) CGFloat left;


@property (nonatomic) CGFloat right;

@end

