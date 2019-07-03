//
//  SecondViewController.m
//  FactoryProject
//
//  Created by ml on 2018/10/19.
//  Copyright © 2018年 MingLi. All rights reserved.
//

#import "SecondViewController.h"
#import "SecondViewConstants.h"
#import "UIEffectsVC.h"
#import "MGIMagePickerVC.h"
#import "MGAlertVC.h"
#import "AlgorithmSummaryVC.h"

@interface SecondViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)NSMutableArray *dataArr;
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleLabel.text = @"发现";
    self.leftButton.hidden = YES;
    
    self.safeBottomMargin = 49;
    self.baseTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, ScreenWidth, ScreenHeight-64) style:UITableViewStylePlain];
    self.baseTableView.frame = CGRectMake(0, 64, ScreenWidth, ScreenHeight-64-self.safeBottomMargin);
    self.baseTableView.delegate = self;
    self.baseTableView.dataSource = self;
    self.baseTableView.backgroundColor = [UIColor colorWithHexString:@"#F4F6F8"];
    self.baseTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.baseTableView];
    
    [self getData];
}


-(void)getData{
    //界面特效
    [self.dataArr addObject:UIEffects];
    //图片选择器
    [self.dataArr addObject:MGTZImagePicker];
    //弹窗提示框
    [self.dataArr addObject:MGAlertFunc];
    //算法总结
    [self.dataArr addObject:AlgorithmSummary];

    [self.baseTableView reloadData];
}


#pragma mark -------------------协议方法-------------------------------
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
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
    if ([titleStr isEqualToString:UIEffects]) {
        UIEffectsVC *effectsVc = [UIEffectsVC new];
        [self.navigationController pushViewController:effectsVc animated:YES];
    }else if([titleStr isEqualToString:MGTZImagePicker]){
        MGIMagePickerVC *pickerVc = [MGIMagePickerVC new];
        [self.navigationController pushViewController:pickerVc animated:YES];
    }else if([titleStr isEqualToString:MGAlertFunc]){
        MGAlertVC *pickerVc = [MGAlertVC new];
        [self.navigationController pushViewController:pickerVc animated:YES];
    }else if([titleStr isEqualToString:AlgorithmSummary]){
        AlgorithmSummaryVC *summaryVc = [AlgorithmSummaryVC new];
        [self.navigationController pushViewController:summaryVc animated:YES];
    }
}


-(NSMutableArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [NSMutableArray new];
    }
    return _dataArr;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
