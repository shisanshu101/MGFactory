//
//  CKAlertViewController.h
//  自定义警告框
//
//  Created by 乔乔智祥 on 16/8/24.
//  Copyright © 2016年 乔乔智祥. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CKAlertAction : NSObject

+ (instancetype)actionWithTitle:(NSString *)title handler:(void (^)(CKAlertAction *action))handler;

@property (nonatomic, readonly) NSString *title;

@end


@interface CKAlertViewController : UIViewController

@property (nonatomic, readonly) NSArray<CKAlertAction *> *actions;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *message;
@property (nonatomic, assign) NSTextAlignment messageAlignment;

@property (nonatomic ,strong)NSString *type;
+ (instancetype)alertControllerWithTitle:(NSString *)title message:(NSString *)message;
- (void)addAction:(CKAlertAction *)action;

@end
