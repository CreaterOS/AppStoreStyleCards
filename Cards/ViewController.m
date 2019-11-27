//
//  ViewController.m
//  Cards
//
//  Created by Bryant Reyn on 2019/11/22.
//  Copyright © 2019 Bryant Reyn. All rights reserved.
//

#import "ViewController.h"
#import "CardsView.h"

@interface ViewController ()
@property (nonatomic,weak)CardsView *cards;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CGRect rect = CGRectMake(10, 50,170, 250);
    
    CardsView *cards = [[CardsView alloc] initWithFrame:rect];
    
    NSMutableDictionary *titileAttDict = [NSMutableDictionary dictionary];
    titileAttDict[NSForegroundColorAttributeName] = [UIColor whiteColor];
    titileAttDict[NSUnderlineStyleAttributeName] = @1;
    titileAttDict[NSFontAttributeName] = [UIFont systemFontOfSize:15];
    
    
    NSMutableDictionary *descAttDict = [NSMutableDictionary dictionary];
    descAttDict[NSForegroundColorAttributeName] = [UIColor whiteColor];
    
    CGRect titleFrame = CGRectMake(0, 0, 200, 40);
    CGRect descFrame = CGRectMake(40, 40, 190, 40);
    
    
    NSArray *subsArray = [NSArray array];
    
    //图片视图
    UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, 250)];
    image.userInteractionEnabled = YES;
    image.image = [UIImage imageNamed:@"Xcode"];
    
    //文本框
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 250, UIScreen.mainScreen.bounds.size.width, 100)];
    textView.text = @"Xcode 是运行在操作系统Mac OS X上的集成开发工具（IDE），由Apple Inc开发。Xcode是开发 macOS 和 iOS 应用程序的最快捷的方式。Xcode 具有统一的用户界面设计，编码、测试、调试都在一个简单的窗口内完成。Xcode同时也是一种语言，作为一种基于XML的语言，Xcode可以设想各种使用场景。它提供了一种独立于工具的可扩展的方法来描述编译时组件的各个方面。";
    [textView setEditable:NO];
    
    //图片视图
    UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 350, UIScreen.mainScreen.bounds.size.width, 250)];
    imageV.userInteractionEnabled = YES;
    imageV.image = [UIImage imageNamed:@"Computer"];
    //图片视图1
    UIImageView *imageV1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 600, UIScreen.mainScreen.bounds.size.width, 250)];
    imageV1.userInteractionEnabled = YES;
    imageV1.image = [UIImage imageNamed:@"GamePage"];
    subsArray = @[image,textView,imageV,imageV1];

    //调用集合添加控件
    cards.subsArray = subsArray;
    cards.listViewFrame = CGRectMake(0, 55, UIScreen.mainScreen.bounds.size.width, UIScreen.mainScreen.bounds.size.height-55);

    //调用设置卡片视图
    [cards show:cards.frame image:[UIImage imageNamed:@"Xcode"] titleFrame:titleFrame titleAttributes:titileAttDict descStrFrame:descFrame descAttributes:descAttDict title:@"Xcode" andDescStr:@""];
    _cards = cards;
    
    //创建动画组
    CAAnimationGroup *group = [[CAAnimationGroup alloc] init];
    
    //最外层添加
    //显示这一部分需要添加动画效果
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"transform.scale";
    //动画结束位置
    //比例缩放 -- 当前宽和高和要变换的比例进行计算
    CGFloat WScale = 1.3;
    CGFloat HScale = 1.2;
    
    NSValue *value = [NSValue valueWithCGSize:CGSizeMake(WScale, HScale)];
    animation.toValue = value;
    //动画时间
    animation.duration = 5;
    animation.speed = 8;
    //返回原来的样子
    animation.fillMode = kCAFillModeBackwards;
    NSMutableArray *animationArray = [NSMutableArray array];
    [animationArray addObject:animation];
    [group setAnimations:animationArray];
    
    cards.animation = animation;
    //设置首页图片显示的宽度
    cards.titleImageH = 250;
    cards.contentSizeH = 800;
    [self.view addSubview:cards];
}

- (IBAction)FinishedBT:(id)sender {
    [_cards dismiss];
}

@end
