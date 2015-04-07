 //
//  ViewController.m
//  MasonryDemo
//
//  Created by tbtCocoaLee on 15/4/7.
//  Copyright (c) 2015年 Wash8. All rights reserved.
//
#import "Masonry.h"
#import "ViewController.h"
//快速定义一个weakSelf
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//  1   居中显示一个View
    WS(ws);
    UIView *sv = [UIView new];
    sv.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:sv];
    [sv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(ws.view);
        make.size.mas_equalTo(CGSizeMake(300, 300));
    }];
    
//// 2 让一个View略小于superView
//    UIView *sv1 = [UIView new];
//    sv1.backgroundColor = [UIColor brownColor];
//    [sv addSubview:sv1];
//    [sv1 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(sv).width.insets(UIEdgeInsetsMake(10, 10, 10, 10));
//        
//    }];
    
    
    
//    3 让两个高度为150的View垂直居中且等宽且等列排布间隔为10
    
//    int padding = 10;
//    UIView *sv2Left = [UIView new];
//    [sv addSubview:sv2Left];
//    sv2Left.backgroundColor = [UIColor brownColor];
//    UIView *sv3Right = [UIView new];
//    [sv addSubview:sv3Right];
//    sv3Right.backgroundColor = [UIColor grayColor];
//    [sv2Left mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.mas_equalTo(sv.mas_centerY);
//        make.left.equalTo(sv.mas_left).with.offset(padding);
//        make.right.equalTo(sv3Right.mas_left).with.offset(-padding);
//        make.height.equalTo(@150);
//        make.width.equalTo(sv3Right);
//        
//    }];
//    
//    
//    [sv3Right mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.mas_equalTo(sv2Left.mas_centerY);
//        make.left.equalTo(sv2Left.mas_right).with.offset(padding);
//        make.right.equalTo(sv.mas_right).with.offset(-padding);
//        make.height.equalTo(@150);
//        make.width.equalTo(sv2Left);
//        
//        
//    }];
    
    
//    4 自适应大小
    UIScrollView *scrollView = [UIScrollView new];
    scrollView.backgroundColor = [UIColor grayColor];
    [ws.view addSubview:scrollView];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(ws.view).with.insets(UIEdgeInsetsMake(5, 5, 5, 5));
    }];
    
    
//    UIView *container = [UIView new];
//    [scrollView addSubview:container];
//    [container mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(scrollView);
//        make.width.equalTo(scrollView);
//    }];
    
    
    int count = 20;
    
    UIView *lastView = nil;
    
    for (int i = 1; i <= count; i++) {
        UIView *subView = [UIView new];
        [scrollView addSubview:subView];
        subView.backgroundColor = [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1];
//        subView.backgroundColor = [UIColor re]
        [subView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.and.right.equalTo(ws.view);
            make.height.mas_equalTo(@(1000*arc4random()%400));
            
            if (lastView) {
                make.top.mas_equalTo(lastView.mas_bottom);
            }else
            {
                make.top.mas_equalTo(scrollView.mas_top);
            }
            
        }];
        
        lastView = subView;
    }

    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(lastView.mas_bottom);
    }];
    
    
    
    
//    5 横向或者纵向等间隙的排列一组View
    
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
