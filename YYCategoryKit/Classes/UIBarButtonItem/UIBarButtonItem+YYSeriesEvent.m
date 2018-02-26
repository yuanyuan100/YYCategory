//
//  UIBarButtonItem+YYSeriesEvent.m
//  Pods
//
//  Created by Mr.Pyy on 2017/7/11.
//
//

#import "UIBarButtonItem+YYSeriesEvent.h"
#import <objc/runtime.h>

NS_ASSUME_NONNULL_BEGIN

static void *YYSeriesEvent_yy_doActionFlag = &YYSeriesEvent_yy_doActionFlag;
static void *YYSeriesEvent_yy_isPreventSeriesEvent = &YYSeriesEvent_yy_isPreventSeriesEvent;
static void *YYSeriesEvent_yy_preventInterval = &YYSeriesEvent_yy_preventInterval;

@interface UIBarButtonItem ()

/**
 时间间隔结束的标识符
 */
@property (nonatomic, getter=yy_isDoActionFlag) BOOL yy_doActionFlag;

@end

@implementation UIBarButtonItem (YYSeriesEvent)

+ (void)load {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    Method originFun = class_getInstanceMethod(self, @selector(_sendAction:withEvent:));
#pragma clang diagnostic pop
    
    Method changeFun = class_getInstanceMethod(self, @selector(yy_sendAction:withEvent:));
    
    method_exchangeImplementations(originFun, changeFun);
}

- (void)yy_sendAction:(nullable SEL)action withEvent:(nullable UIEvent *)event {
    if (self.yy_isPreventSeriesEvent == NO) {
        [self yy_doAction];
    } else {
        if (self.yy_isDoActionFlag == NO) {
            self.yy_doActionFlag = YES;
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(self.yy_preventInterval * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                self.yy_doActionFlag = NO;
            });
            [self yy_doAction];
        }
    }
}

- (void)yy_doAction {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    [self.target performSelector:self.action withObject:self];
#pragma clang diagnostic pop
}

#pragma mark ------- getter or setter
- (BOOL)yy_isDoActionFlag {
    id flag = objc_getAssociatedObject(self, YYSeriesEvent_yy_doActionFlag);
    return [(NSNumber *)flag boolValue];
}

- (void)setYy_doActionFlag:(BOOL)yy_doActionFlag {
    if (self.yy_isDoActionFlag != yy_doActionFlag) {
        objc_setAssociatedObject(self, YYSeriesEvent_yy_doActionFlag, [NSNumber numberWithBool:yy_doActionFlag], OBJC_ASSOCIATION_ASSIGN);
    }
}

- (BOOL)yy_isPreventSeriesEvent {
    id flag = objc_getAssociatedObject(self, YYSeriesEvent_yy_isPreventSeriesEvent);
    return [(NSNumber *)flag boolValue];
}

- (void)setYy_preventSeriesEvent:(BOOL)yy_preventSeriesEvent {
    if (self.yy_isPreventSeriesEvent != yy_preventSeriesEvent) {
        objc_setAssociatedObject(self, YYSeriesEvent_yy_isPreventSeriesEvent, [NSNumber numberWithBool:yy_preventSeriesEvent], OBJC_ASSOCIATION_ASSIGN);
    }
}

- (NSTimeInterval)yy_preventInterval {
    id flag = objc_getAssociatedObject(self, YYSeriesEvent_yy_preventInterval);
    // 给出默认值
    if (nil == flag) return 1.f;
    return [(NSNumber *)flag doubleValue];
}

- (void)setYy_preventInterval:(NSTimeInterval)yy_preventInterval {
    if (self.yy_preventInterval != yy_preventInterval) {
        objc_setAssociatedObject(self, YYSeriesEvent_yy_preventInterval, [NSNumber numberWithDouble:yy_preventInterval], OBJC_ASSOCIATION_ASSIGN);
    }
}
@end

NS_ASSUME_NONNULL_END
