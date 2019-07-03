//
//  YuQuanConstant.h
//  YuLin
//
//  Created by 梁羽 on 2017/4/18.
//  Copyright © 2017年 zhishi. All rights reserved.
//

#ifndef YuQuanConstant_h
#define YuQuanConstant_h


#endif /* YuQuanConstant_h */

static NSInteger const yuQuan_bottomBarHeight = 44;
static NSInteger const yuQuan_subBottomBarHeight = 38;
static NSInteger const yuQuan_topBarHeight = 64;

static NSInteger const yuQuan_showDescTextHeight = 56;//56以下为最多3行，否则为多于3行

#pragma mark 品牌圈相关view高度
static NSInteger const yuQuan_bottomMenuViewHeight = 45; //品牌圈下面菜单栏的高度
static NSInteger const yuQuan_brandSignlePostViewHeight = 223; //品牌圈帖子栏存在一个帖子时高度
static NSInteger const yuQuan_brandMultiplePostViewHeight = 176; //品牌圈帖子栏存在多个帖子高度
static NSInteger const yuQuan_brandLiveViewHeight = 269; //品牌圈直播栏高度
static NSInteger const yuQuan_brandGoodsViewHeight = 245; //品牌圈商品栏高度

static NSString *const kGoTopNotificationName = @"goTop";//进入置顶命令
static NSString *const kLeaveTopNotificationName = @"leaveTop";//离开置顶命令

static NSString *const YuQuanGoodsToTopNotification = @"YuQuanGoodsToTopNotification";//鱼圈交易进入置顶命令

/**
 下面的几个通知是为了添加鱼圈详情界面的下拉刷新功能添加的
 */
//click sub title notify
static NSString * const YuQuanSubTitleClickNotification = @"YuQuanSubTitleClickNotification";

//refresh newest
static NSString * const YuQuanRefreshNewestCategoryNotification = @"YuQuanRefreshNewestCategoryNotification";

//refresh hotest
static NSString * const YuQuanRefreshHotestCategoryNotification = @"YuQuanRefreshHotestCategoryNotification";

//refresh feed
static NSString * const YuQuanRefreshFeedCategoryNotification = @"YuQuanRefreshFeedCategoryNotification";

//refresh topic
static NSString * const YuQuanRefreshTopicCategoryNotification = @"YuQuanRefreshTopicCategoryNotification";

//refresh goods
static NSString * const YuQuanRefreshGoodsCategoryNotification = @"YuQuanRefreshGoodsCategoryNotification";

//refresh jia meng shang
static NSString * const YuQuanRefreshJiaMengShangCategoryNotification = @"YuQuanRefreshJiaMengShangCategoryNotification";

//head refresh end
static NSString * const YuQuanSubCategoryEndHeaderRefresh = @"YuQuanSubCategoryEndHeaderRefresh";

#pragma mark 鱼圈部分API
static NSString * const YuQuanBrandJiaMengShangListApi = @"api.php?mod=BrandStore&act=weiba_store_list";
