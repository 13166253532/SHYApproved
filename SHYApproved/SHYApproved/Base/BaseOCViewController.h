//
//  BaseOCViewController.h
//  NineClouds
//
//  Created by xiejiangbo on 2017/11/23.
//  Copyright © 2017年 yin chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseOCViewController : UIViewController
//+(UIViewController *)createViewController;
//导航栏不遮挡
-(void)isNavigationBarObstructed;
// 设置状态栏颜色
-(void)initSetStatusBarColor;
// 设置导航栏 透明
-(void)hideNavigationBar;
//恢复导航栏 透明
-(void)displayNavigationBar;
// 设置导航栏
-(void)initTitleBar;
-(void)arrowResponse;
@end
