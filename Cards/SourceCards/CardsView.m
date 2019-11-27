//
//  CardsView.m
//  Cards
//
//  Created by Bryant Reyn on 2019/11/22.
//  Copyright © 2019 Bryant Reyn. All rights reserved.
//

#import "CardsView.h"
#import "CardsListView.h"

@interface CardsView()
@property (nonatomic,weak)UIImageView *imageView;
@property (nonatomic,weak)CardsListView *listView;
@end

@implementation CardsView

#pragma mark - awakeFromNib
- (void)awakeFromNib{
    [super awakeFromNib];
}


#pragma mark - show
- (void)show:(CGRect)imageFrame image:(UIImage *)image titleFrame:(CGRect)titleFrame titleAttributes:(NSMutableDictionary *)titledict descStrFrame:(CGRect)descFrame descAttributes:(NSMutableDictionary *)descdict title:(NSString *)title andDescStr:(NSString *)desc{
    //默认使用图片作为占位符
    //需要ImageView填充
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:imageFrame];
    _imageView = imageView;
    imageView.image = image;
    //使得imageView获得点击事件
    imageView.userInteractionEnabled = YES;
    //添加到视图上
    [self addSubview:imageView];
   
    //添加点击按钮
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showTheMenuList)];
    
    //添加到卡片上
    [self addGestureRecognizer:tapGesture];
    
    //设置标题
    [self setTheTitle:titleFrame titleAttributes:titledict andStr:title];
    //描述标签
    [self setTheDiscStr:descFrame attributesStr:descdict andDescStr:desc];
}

#pragma mark - 设置标题
- (void)setTheTitle:(CGRect)frame titleAttributes:(NSMutableDictionary*)dict andStr:(NSString *)title{
    //在添加标题和应用名称
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:frame];
    _titleLable = titleLabel;
    NSAttributedString *attStr = [[NSAttributedString alloc] initWithString:title attributes:dict];
    [titleLabel setAttributedText:attStr];
    [_imageView addSubview:_titleLable];
}

#pragma mark - 描述标签
- (void)setTheDiscStr:(CGRect)frame attributesStr:(NSMutableDictionary*)dict andDescStr:(NSString *)descStr{
    UILabel *descL = [[UILabel alloc] initWithFrame:frame];
    _descLable = descL;
    NSAttributedString *attrStr = [[NSAttributedString alloc] initWithString:descStr attributes:dict];
    [descL setAttributedText:attrStr];
    [_imageView addSubview:_descLable];
}

#pragma mark - 展示详情界面
- (void)showTheMenuList{
    //显示Image的画面 -- 底部显示程序员需要的控件
    //使用一个可变数组保存需要添加的控件，然后遍历添加到视图中
    //需要使用一个新的View来管理
    CardsListView *listView = [[CardsListView alloc] initWithFrame:_listViewFrame];
    //设置显示图片的大小
    listView.titleImageHeight = self.titleImageH;
    _listView = listView;
    //内容区域大小
    if(self.contentSizeH == 0){
        self.contentSizeH = 1000;
    }
    CGSize contentSize = CGSizeMake(_listViewFrame.size.width,self.contentSizeH);
    
    /* 添加子控件 */
    [listView showListView:_imageView scrollViewSize:contentSize addSubViewArray:_subsArray];

    //设置动画
    [self setAnimation];
    //添加菜单
    [[UIApplication sharedApplication].keyWindow addSubview:self.listView];
   
}

#pragma mark - 设置动画效果
- (void)setAnimation{
    if(_animation){
        //添加到图层上
        [self.listView.layer addAnimation:_animation forKey:nil];
    }
}

#pragma mark - dismiss
- (void)dismiss{
    //移除视图
    [_listView removeFromSuperview];
}


@end
