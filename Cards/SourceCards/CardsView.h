//
//  CardsView.h
//  Cards
//
//  Created by Bryant Reyn on 2019/11/22.
//  Copyright © 2019 Bryant Reyn. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CardsView : UIView

@property (nonatomic,strong)NSArray *subsArray; //视图集合
@property (nonatomic,assign)CGRect listViewFrame; //列表的大小
@property (nonatomic,assign)CGFloat titleImageH; //第一个页面的高度
@property (nonatomic,assign)CGFloat contentSizeH;//ListView的内容区域的高度
@property (nonatomic,strong)CABasicAnimation *animation; //动画设置
@property (nonatomic,strong)UILabel *titleLable; //标题标签
@property (nonatomic,strong)UILabel *descLable; //描述标签
//调用show函数进行显示
- (void)show:(CGRect)imageFrame image:(UIImage *)image titleFrame:(CGRect)titleFrame titleAttributes:(NSMutableDictionary *)titledict descStrFrame:(CGRect)descFrame descAttributes:(NSMutableDictionary *)descdict title:(NSString *)title andDescStr:(NSString *)desc;

//取消列表显示
- (void)dismiss;
@end

NS_ASSUME_NONNULL_END
