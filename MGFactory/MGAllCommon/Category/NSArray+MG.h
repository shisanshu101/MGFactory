//
//  NSArray+MG.h
//  MGFactory
//
//  Created by 一只狗 on 2019/7/3.
//  Copyright © 2019 longdian. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (MG)

- (id)objectOrNilAtIndex:(NSUInteger)index;

+ (BOOL)isNotEmptyArray:(id)objc;


@end

NS_ASSUME_NONNULL_END
