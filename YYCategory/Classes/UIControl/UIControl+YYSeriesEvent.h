//
//  UIControl+YYSeriesEvent.h
//  Pods
//
//  Created by Mr.Pyy on 2017/7/12.
//
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIControl (YYSeriesEvent)
/**
 是否开启阻止连续点击事件
 if YES 阻止，default NO
 */
@property (nonatomic, getter=yy_isPreventSeriesEvent) BOOL yy_preventSeriesEvent;

/**
 设置防止连续点击的时间间隔
 default 1.0s;
 
 如果要使用该属性，请先设置 yy_preventSeriesEvent is YES.
 */
@property (nonatomic, assign) NSTimeInterval yy_preventInterval;

@end

NS_ASSUME_NONNULL_END
