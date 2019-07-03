//
//  YLNavHolderBaseViewController.h
//  YuLin
//
//  Created by 处光夫 on 2018/11/13.
//  Copyright © 2018 zhishi. All rights reserved.
//

#import "BaseViewController.h"
#import "RecognizeSimultaneousTableView.h"

@interface YLNavHolderBaseViewController : BaseViewController

/**
 底部的tableview
 */
@property (nonatomic, strong) RecognizeSimultaneousTableView *backTableview;

@end
