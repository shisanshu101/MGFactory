//
//  YLNavHolderBaseView.m
//  YuLin
//
//  Created by 处光夫 on 2018/11/14.
//  Copyright © 2018 zhishi. All rights reserved.
//

#import "YLNavHolderBaseView.h"
#import "YLNavHolderBaseListView.h"

@interface YLNavHolderBaseView ()
{}
@end

@implementation YLNavHolderBaseView

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self creatSubView];
    }
    return self;
}

-(void)creatSubView {
    
    UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.width, 56)];
    topView.backgroundColor = [UIColor redColor];
    [self addSubview:topView];
    
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, topView.bottom, self.width, self.height - topView.bottom)];
    scrollView.contentSize = CGSizeMake(MainScreenWidth * 3, scrollView.height);
    scrollView.pagingEnabled = YES;
    [self addSubview:scrollView];
    
    for (int i = 0; i < 3; i++) {
        YLNavHolderBaseListView *listView = [[YLNavHolderBaseListView alloc] initWithFrame:CGRectMake(scrollView.width * i, 0, scrollView.width, scrollView.height)];
        [scrollView addSubview:listView];
    }
}

@end
