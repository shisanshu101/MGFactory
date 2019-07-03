//
//  NSArray+MG.m
//  MGFactory
//
//  Created by 一只狗 on 2019/7/3.
//  Copyright © 2019 longdian. All rights reserved.
//

#import "NSArray+MG.h"

@implementation NSArray (MG)

- (id)objectOrNilAtIndex:(NSUInteger)index {
    return index < self.count ? self[index] : nil;
}

+ (BOOL)isNotEmptyArray:(id)objc {
    if (((![objc isKindOfClass:[NSNull class]]) && objc) && [objc isKindOfClass:[self class]] && [objc count]) {
        return YES;
    }
    return NO;
}


@end
