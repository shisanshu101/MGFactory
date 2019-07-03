//
//  UIEffectsVC.m
//  FactoryProject
//
//  Created by ml on 2018/11/14.
//  Copyright © 2018年 MingLi. All rights reserved.
//

#import "UIEffectsVC.h"
#import "UIEffectsConstants.h"
#import "MGTableViewHoverVC.h"
#import "YLNavHolderBaseViewController.h"
#import "MGIMGScrollAndEnlargeVC.h"

@interface UIEffectsVC ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *dataArr;
@property(nonatomic,assign)NSInteger pageNum;
@property(nonatomic,assign)BOOL isLoadMore;

@end

@implementation UIEffectsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleLabel.text = @"界面特效";
    [self getData];
}

#pragma mark -------------------获取数据-------------------------------
-(void)getData{

    [self.dataArr addObject:tableViewHover];
    [self.dataArr addObject:tableViewHover2];
    [self.dataArr addObject:imgScrollAndEnlarge];
    
    [self endRefresh];
}

-(void)endRefresh{
    [self.tableView reloadData];
}

#pragma mark -------------------协议方法-------------------------------
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *reuseID = @"reuseID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseID];
    }
    
    cell.textLabel.text = [self.dataArr objectOrNilAtIndex:indexPath.row];
    
    return cell;
}




-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *titleStr = [self.dataArr objectOrNilAtIndex:indexPath.row];
    if ([titleStr isEqualToString:tableViewHover]) {
        YLNavHolderBaseViewController *hoverVc = [YLNavHolderBaseViewController new];
        hoverVc.title = tableViewHover;
        [self.navigationController pushViewController:hoverVc animated:YES];
    }else if ([titleStr isEqualToString:tableViewHover2]){
        
    }else if ([titleStr isEqualToString:imgScrollAndEnlarge]){
        MGIMGScrollAndEnlargeVC *enlargeVC = [MGIMGScrollAndEnlargeVC new];
        [self.navigationController pushViewController:enlargeVC animated:YES];
    }
}

#pragma mark -------------------懒加载-------------------------------
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,64,ScreenWidth,ScreenHeight - 64) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

-(NSMutableArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [NSMutableArray new];
    }
    return _dataArr;
}

@end
