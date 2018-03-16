//
//  UIDevice+YYInterfaceOrientation.h
//  YYCategoryKit
//
//  Created by Yvan.Peng on 2018/3/16.
//

#import <UIKit/UIKit.h>

@interface UIDevice (YYInterfaceOrientation)
/// 输入要强制转屏的方向
+ (void)yy_switchNewOrientation:(UIInterfaceOrientation)interfaceOrientation;

@end
