//
//  UIScreen+YYSize.h
//  YYCategoryKit
//
//  Created by Yvan.Peng on 2018/2/26.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, UIScrrenYYSize) {
    UIScrrenYYSize_Unkown    = 0,    // 未知的屏幕尺寸
    UIScrrenYYSize_320x480   = 1,    // 3.5--1X--3GS
    UIScrrenYYSize_640x960   = 2,    // 3.5--2X--4 4S
    UIScrrenYYSize_640x1136  = 3,    // 4.0--2X--5S 5C SE
    UIScrrenYYSize_750x1334  = 4,    // 4.7--2X--6 6S 7 8
    UIScrrenYYSize_1080x1920 = 5,    // 5.5--3X(2.608)--6(S)P+ 7+ 8+
    UIScrrenYYSize_1125x2436 = 6,    // 5.8--3X--X
};

@interface UIScreen (YYSize)
// 返回屏幕样式(mainScreen)
+ (UIScrrenYYSize)yy_type;
// 查找屏幕尺寸
+ (CGSize)yy_sizeType:(UIScrrenYYSize)type;

// 返回屏幕Size(mainScreen)
@property (class, nonatomic, readonly) CGSize yy_size;
//mainScreen 的宽高
@property (class, nonatomic, readonly) CGFloat yy_width;
@property (class, nonatomic, readonly) CGFloat yy_height;
@end
