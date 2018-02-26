//
//  UIView+YYTouchRangeExpansion.h
//  Pods
//
//  Created by Mr.Pyy on 2017/7/11.
//
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (YYTouchRangeExpansion)

/**
 是否扩大点击范围
 */
@property (nonatomic, getter=yy_isExtendedTouch) BOOL yy_extendedTouch;

/**
 扩大点击范围的外边距,默认扩大至CGSizeMake(44.f, 44.f),(默认扩大后bouns.origin 依然 CGPointMake(0,0)，改变的只是size)
 
 因为 UIEdgeInsets 是内边距. top, bottom, left, right 为正(+)则为内边距。
 因此外边距符号为负(-)
 
 如果需要扩大点击范围，请先设置 extendedTouch is YES.
 */
@property (nonatomic, assign) UIEdgeInsets yy_extendedTouchEdge;

@end

NS_ASSUME_NONNULL_END
