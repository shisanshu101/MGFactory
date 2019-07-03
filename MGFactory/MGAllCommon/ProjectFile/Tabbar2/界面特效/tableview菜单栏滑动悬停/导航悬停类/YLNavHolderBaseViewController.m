//
//  YLNavHolderBaseViewController.m
//  YuLin
//
//  Created by 处光夫 on 2018/11/13.
//  Copyright © 2018 zhishi. All rights reserved.
//

#import "YLNavHolderBaseViewController.h"
#import "YLNavHolderBaseView.h"
#import "YuQuanConstant.h"

@interface YLNavHolderBaseViewController ()<UITableViewDelegate, UITableViewDataSource>
{
    UIEdgeInsets _safeInsets;
}
@property (nonatomic, assign) BOOL isTopIsCanNotMoveTabView;
@property (nonatomic, assign) BOOL isTopIsCanNotMoveTabViewPre;
@property (nonatomic, assign) BOOL canScroll;
@end

@implementation YLNavHolderBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleImage.hidden = YES;
    _safeInsets = UIEdgeInsetsMake(20, 0, 0, 0);
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(acceptMsg:) name:kLeaveTopNotificationName object:nil];
    
    [self creatTableView];
}

-(void)viewSafeAreaInsetsDidChange {
    [super viewSafeAreaInsetsDidChange];
    _safeInsets = sgm_safeAreaInset(self.view);
}

#pragma mark 创建tableview
-(void)creatTableView {
    self.backTableview = [[RecognizeSimultaneousTableView alloc] initWithFrame:CGRectMake(0, 0, MainScreenWidth, MainScreenHeight) style:UITableViewStylePlain];
    self.backTableview.delegate = self;
    self.backTableview.dataSource = self;
    self.backTableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.backTableview.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    self.backTableview.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.backTableview];
    //self.backTableview.mj_header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRefresh)];
    
    if (@available(iOS 11.0, *)) {
        self.backTableview.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        // Fallback on earlier versions
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
}

#pragma mark 下拉刷新
-(void)headerRefresh {
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 400;
    }else {
        return MainScreenHeight - 20;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        static NSString *cellId = @"sectionOnecell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        cell.textLabel.text = [NSString stringWithFormat:@"第%ld区 - 第%ld行",indexPath.section,indexPath.row];
        return cell;
    }else if (indexPath.section == 1) {
        static NSString *cellId = @"sectionTwocell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            YLNavHolderBaseView *tabBaseView = [[YLNavHolderBaseView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, MainScreenHeight - 20)];
            [cell.contentView addSubview:tabBaseView];
            
        }
        return cell;
    }else {
        return nil;
    }
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat tabOffsetY = [self.backTableview rectForSection:1].origin.y - _safeInsets.top; //顶部tabbar到第1个区的距离
    _isTopIsCanNotMoveTabViewPre = _isTopIsCanNotMoveTabView;
    if (scrollView.contentOffset.y + 1 >= tabOffsetY) { //说明第2个区滑动到了顶部
        scrollView.contentOffset = CGPointMake(0, tabOffsetY); //将tableview的纵坐标固定为tabOffsetY大小，也即tableview滑动到第2个区的时候就不能再往上滑动了
        _isTopIsCanNotMoveTabView = YES; //置顶后为YES
        scrollView.showsVerticalScrollIndicator = NO;
    }else{
        _isTopIsCanNotMoveTabView = NO; //非置顶状态为NO
        scrollView.showsVerticalScrollIndicator = YES;
    }
    if (_isTopIsCanNotMoveTabView != _isTopIsCanNotMoveTabViewPre) { //说明处在滑动到顶端和离开顶端的零界点
        if (!_isTopIsCanNotMoveTabViewPre && _isTopIsCanNotMoveTabView) { //刚刚滑动到顶端
            [[NSNotificationCenter defaultCenter] postNotificationName:kGoTopNotificationName object:nil userInfo:@{@"canScroll":@"1"}];
            _canScroll = NO;
        }
        if(_isTopIsCanNotMoveTabViewPre && !_isTopIsCanNotMoveTabView){ //刚刚离开顶端
            if (!_canScroll) {
                scrollView.contentOffset = CGPointMake(0, tabOffsetY);
            }
        }
    }
}

-(void)acceptMsg: (NSNotification *)notification{
    NSDictionary *userInfo = notification.userInfo;
    NSString *canScroll = userInfo[@"canScroll"];
    if ([canScroll isEqualToString:@"1"]) {
        _canScroll = YES;  //刚刚滑动到顶端
    }
}

-(void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
