//
//  UIView+YYLine.h
//  YYCategoryKit
//
//  Created by Yvan.Peng on 2018/3/7.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, YYLineDirection) {
    YYLineDirectionTop    = 1 << 0,
    YYLineDirectionLeft   = 1 << 1,
    YYLineDirectionBottom = 1 << 2,
    YYLineDirectionRight  = 1 << 3,
};

struct YYLinePosition {
    CGFloat start;
    CGFloat end;
    CGFloat space;
    CGFloat width;
};
typedef struct CG_BOXABLE YYLinePosition YYLinePosition;

/// 创建 struct YYLinePosition
/// start:距离父控件上(或左)的距离;
/// end:距离父控件下(或右)的距离
/// space:距离父控件边缘的间隔;
/// width:线的宽度,默认 kYYLineWidth
extern YYLinePosition YYLinePositionMake(CGFloat s, CGFloat e, CGFloat p, CGFloat w);
/// 默认线宽.
extern const CGFloat kYYLineWidth;

@interface UIView (YYLine)
- (NSArray<UIView *> *)addLinePosition:(YYLineDirection)direction;
- (NSArray<UIView *> *)addLinePosition:(YYLineDirection)direction position:(YYLinePosition)position;
- (NSArray<UIView *> *)addLinePosition:(YYLineDirection)direction color:(UIColor *)color;
/**
 添加一根线view到当前view上

 @param direction 方位,上下左右
 @param color 颜色
 @param position 约束
 @return 返回所有的lineView 按照 枚举YYLineDirection的顺序装在数组中
 */
- (NSArray<UIView *> *)addLinePosition:(YYLineDirection)direction color:(UIColor *)color position:(YYLinePosition)position;
@end

