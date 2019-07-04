//
//  BaseTableViewController.m
//  MGFactory
//
//  Created by 一只狗 on 2019/7/4.
//  Copyright © 2019 longdian. All rights reserved.
//

#import "BaseTableViewController.h"

@interface BaseTableViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *dataArr;

@end

@implementation BaseTableViewController

-(void)viewSafeAreaInsetsDidChange {
    [super viewSafeAreaInsetsDidChange];
    UIEdgeInsets safeInsets = sgm_safeAreaInset(self.view);
    if (self.baseTableView) {
        self.baseTableView.top = safeInsets.top + self.safeTopMargin;
        self.baseTableView.height = self.view.safeAreaLayoutGuide.layoutFrame.size.height - self.safeTopMargin - self.safeBottomMargin;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
}

-(void)getSeverData{
    
}

-(void)createUI{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,64,ScreenWidth, ScreenHeight - 64) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

@end
