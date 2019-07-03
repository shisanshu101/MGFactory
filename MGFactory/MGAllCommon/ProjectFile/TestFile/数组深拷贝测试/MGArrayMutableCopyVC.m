//
//  MGArrayMutableCopyVC.m
//  FactoryProject
//
//  Created by 一只狗 on 2019/6/28.
//  Copyright © 2019 MingLi. All rights reserved.
//

#import "MGArrayMutableCopyVC.h"
#import "MGArrayMutableCopyModel.h"

@interface MGArrayMutableCopyVC ()

@property(nonatomic,strong)NSMutableArray *tempArr;

@end

@implementation MGArrayMutableCopyVC

- (void)viewDidLoad {
    [super viewDidLoad];
   
    NSMutableArray *arr = [NSMutableArray new];
    
    for (int i = 0; i < 10; i ++) {
        MGArrayMutableCopyModel *model = [MGArrayMutableCopyModel new];
        model.titleStr = @"AAA";
        model.descStr = @"aaa";
        [arr addObject:model];
    }
    
    
    self.tempArr = [NSKeyedUnarchiver unarchiveObjectWithData:[NSKeyedArchiver archivedDataWithRootObject:arr]];
    
    MGArrayMutableCopyModel *firstModel = [self.tempArr firstObject];
    firstModel.titleStr = @"BBB";
    firstModel.descStr = @"bbb";
    
    NSLog(@"arr=========%@",arr);
    NSLog(@"self.tempArr=========%@",self.tempArr);
}



@end
