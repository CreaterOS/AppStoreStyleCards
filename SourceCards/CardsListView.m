//
//  CardsListView.m
//  Cards
//
//  Created by Bryant Reyn on 2019/11/22.
//  Copyright © 2019 Bryant Reyn. All rights reserved.
//

#import "CardsListView.h"

@implementation CardsListView

#pragma mark - 初始化设置滚动页面
- (void)awakeFromNib{
    [super awakeFromNib];
    //设置是否允许滚动
    [self setScrollEnabled:YES];
    self.userInteractionEnabled = YES;
    self.scrollsToTop = YES;
}

- (void)showListView:(UIView *)imageView scrollViewSize:(CGSize)size addSubViewArray:(NSArray *)subsArray{
    //设置内容分为大小
    [self setContentSize:size];
    
    //添加最开始的视图
    //首页展示图的显示
    //高度自定义
    if(self.titleImageHeight == 0){
        self.titleImageHeight = 250;
    }

    //添加子控件
    /*** 控件 ***/
    //遍历添加
    if([subsArray count] != 0){
        for (id obj in subsArray) {
            [self addSubview:obj];
        }
    }

}
@end
