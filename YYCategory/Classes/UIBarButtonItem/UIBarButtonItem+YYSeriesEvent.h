//
//  UIBarButtonItem+YYSeriesEvent.h
//  Pods
//
//  Created by Mr.Pyy on 2017/7/11.
//
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/* 测试范围iOS8.1至iOS10.3可用 */

@interface UIBarButtonItem (YYSeriesEvent)

/**
 是否开启阻止连续点击事件 
 if YES 阻止，default NO
 */
@property (nonatomic, getter=yy_isPreventSeriesEvent) BOOL yy_preventSeriesEvent NS_AVAILABLE_IOS(8.0);

/**
 设置防止连续点击的时间间隔
 default 1.0s;
 
 如果要使用该属性，请先设置 yy_preventSeriesEvent is YES.
 */
@property (nonatomic, assign) NSTimeInterval yy_preventInterval NS_AVAILABLE_IOS(8.0);

@end

NS_ASSUME_NONNULL_END
