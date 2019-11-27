//
//  CardsListView.h
//  Cards
//
//  Created by Bryant Reyn on 2019/11/22.
//  Copyright © 2019 Bryant Reyn. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CardsListView : UIScrollView

@property (nonatomic,assign)CGFloat titleImageHeight; //标题图片高度设置

- (void)showListView:(UIView *)imageView scrollViewSize:(CGSize)size addSubViewArray:(NSArray *)subsArray;
@end

NS_ASSUME_NONNULL_END
