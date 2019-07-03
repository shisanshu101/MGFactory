//
//  MGArrayMutableCopyModel.m
//  FactoryProject
//
//  Created by 一只狗 on 2019/6/28.
//  Copyright © 2019 MingLi. All rights reserved.
//

#import "MGArrayMutableCopyModel.h"

@implementation MGArrayMutableCopyModel

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.titleStr forKey:@"titleStr"];
    [aCoder encodeObject:self.descStr forKey:@"descStr"];
}


- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if (self){
        self.titleStr = [aDecoder decodeObjectForKey:@"titleStr"];
        self.descStr = [aDecoder decodeObjectForKey:@"descStr"];
    }

    return self;
}

-(NSString *)description{
    return [NSString stringWithFormat:@"titleStr=%@----descStr=%@",self.titleStr,self.descStr];
}

@end
