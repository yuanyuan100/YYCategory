//
//  UIApplication+YY_TopViewController.h
//  SMCBProjcet
//
//  Created by SMCB on 2017/11/21.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIApplication (YY_TopViewController)
/// 返回当前最顶层的控制器(UIAlertController除外)
@property (class, nonatomic, readonly) UIViewController *yy_topViewController;
@end
