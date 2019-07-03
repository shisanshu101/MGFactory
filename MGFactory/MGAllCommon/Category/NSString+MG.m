//
//  NSString+MG.m
//  MGFactory
//
//  Created by 一只狗 on 2019/7/3.
//  Copyright © 2019 longdian. All rights reserved.
//

#import "NSString+MG.h"

@implementation NSString (MG)

+(BOOL)isNotEmptyString:(id)objc {
    if (((![objc isKindOfClass:[NSNull class]]) && objc) && [objc isKindOfClass:[self class]] && [((NSString*)objc) length]) {
        return YES;
    }
    return NO;
}

@end
