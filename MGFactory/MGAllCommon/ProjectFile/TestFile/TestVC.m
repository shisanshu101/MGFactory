//
//  TestVC.m
//  FactoryProject
//
//  Created by ml on 2018/10/22.
//  Copyright © 2018年 MingLi. All rights reserved.
//

#import "TestVC.h"
#import "UICollectionViewTestVC.h"
#import "AllViewInit.h"
#import "MGArrayMutableCopyVC.h"

@interface TestVC ()

@property(nonatomic,strong)YYTextView *textView;
@property(nonatomic,strong)YYLabel *yyLab;
@property(nonatomic,strong)LDLabel *collTestLab;
@property(nonatomic,strong)LDLabel *gcdTestLab;

@property(nonatomic,copy)NSString*str1;

@property(nonatomic,strong)NSString*str2;

@end

@implementation TestVC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.titleLabel.text = @"测试一下";
    
//    DebugLog(@"添加一下版本哇");
//    DebugLog(@"添加一下版本哇22222");
    

//    //测试YYTextView使用
//    [self useYYTextView];
//    //测试YYText和YYLab使用
//    [self useYYLabAndYYText];
//
//    [self jumpToCollectionViewTest];
//
//    //GCD程序测试
//    [self gcdTest];
    
//    NSMutableString *str= [NSMutableString stringWithFormat:@"helloworld"];
//    self.str1=str;
//    self.str2=str;
//    NSLog(@"str:%p--%p",str,&str);
//    NSLog(@"copy_str:%p--%p",_str1,&_str1);
//    NSLog(@"strong_str:%p--%p",_str2,&_str2);
//
//    [str appendString:@"hry"];
//    NSLog(@"****************%@",self.str1);
//    NSLog(@"****************%@",self.str2);
    
    MJWeakSelf;
    LDLabel *clickLab = [LDLabel labelWithFrame:CGRectMake(0, 100,ScreenWidth, 20) withTitle:@"点我" withFont:16 withtextColor:[UIColor colorWithHexString:@"#333333"] withBackColor:nil];
    [self.view addSubview:clickLab];
    clickLab.userInteractionEnabled = YES;
    clickLab.clickLabel = ^{
        DebugLog(@"点我");
        [weakSelf.navigationController pushViewController:[MGArrayMutableCopyVC new] animated:YES];
    };
    
}

//测试YYTextView使用
-(void)useYYTextView{
    YYTextView *textView = [[YYTextView alloc] initWithFrame:CGRectMake(10, 100,ScreenWidth - 20, 90)];
    textView.backgroundColor = [UIColor yellowColor];
    textView.placeholderText = @"textview测试";
    _textView = textView;
    [self.view addSubview:textView];
}

//测试YYText和YYLab使用
-(void)useYYLabAndYYText{
    YYLabel *yyLab = [[YYLabel alloc] initWithFrame:CGRectMake(10, _textView.bottom + 10,ScreenWidth - 20, 90)];
    yyLab.text = @"YYLab的测试，包括字间距和行间距，是否这些间距必须设置";
    yyLab.numberOfLines = 0;
    _yyLab = yyLab;
    [self.view addSubview:yyLab];
    
    
    NSString *attrCeShiStr = @"点我干嘛呀？点我干嘛呀？";
    NSString *allStr = [NSString stringWithFormat:@"%@YYLab的富文本添加",attrCeShiStr];
    
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:allStr];
    
    
    
    [attrStr setTextHighlightRange:[allStr rangeOfString:attrCeShiStr] color:[UIColor redColor] backgroundColor:[UIColor yellowColor] tapAction:^(UIView * _Nonnull containerView, NSAttributedString * _Nonnull text, NSRange range, CGRect rect) {
        NSLog(@"点我干嘛？？？？？");
    }];
    yyLab.attributedText = attrStr;
}

-(void)jumpToCollectionViewTest{
    MJWeakSelf;
    
    LDLabel *collTestLab = [LDLabel labelWithFrame:CGRectMake(10, _yyLab.bottom + 10, ScreenWidth - 10*2, 30) withTitle:@"测试CollectionView" withFont:16 withtextColor:[UIColor colorWithHexString:@"000000"] withBackColor:nil];
    collTestLab.textAlignment = NSTextAlignmentLeft;
    collTestLab.userInteractionEnabled = YES;
    _collTestLab = collTestLab;
    [self.view addSubview:collTestLab];
    
    collTestLab.clickLabel = ^{
        [weakSelf.navigationController pushViewController:[UICollectionViewTestVC new] animated:YES];
    };
}


-(void)gcdTest{
    MJWeakSelf;
    LDLabel *gcdTestLab = [LDLabel labelWithFrame:CGRectMake(10, _collTestLab.bottom + 10, ScreenWidth - 10*2, 30) withTitle:@"测试GCD线程" withFont:16 withtextColor:[UIColor colorWithHexString:@"000000"] withBackColor:nil];
    gcdTestLab.textAlignment = NSTextAlignmentLeft;
    gcdTestLab.userInteractionEnabled = YES;
    _gcdTestLab = gcdTestLab;
    [self.view addSubview:gcdTestLab];
    
    gcdTestLab.clickLabel = ^{
        //死锁
        [weakSelf gcdDeadLockTest];
    };
}

//死锁
-(void)gcdDeadLockTest{
    
    
    
    
    NSLog(@"1");
    
    dispatch_sync(dispatch_get_main_queue(), ^{
        NSLog(@"2");
    });
    NSLog(@"3");
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
