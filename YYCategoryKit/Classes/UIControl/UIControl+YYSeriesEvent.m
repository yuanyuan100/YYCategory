//
//  UIControl+YYSeriesEvent.m
//  Pods
//
//  Created by Mr.Pyy on 2017/7/12.
//
//

#import "UIControl+YYSeriesEvent.h"
#import <objc/runtime.h>

NS_ASSUME_NONNULL_BEGIN

static void *YYSeriesEvent_yy_doActionFlag = &YYSeriesEvent_yy_doActionFlag;
static void *YYSeriesEvent_yy_isPreventSeriesEvent = &YYSeriesEvent_yy_isPreventSeriesEvent;
static void *YYSeriesEvent_yy_preventInterval = &YYSeriesEvent_yy_preventInterval;

@interface UIControl ()
/**
 时间间隔结束的标识符
 */
@property (nonatomic, getter=yy_isDoActionFlag) BOOL yy_doActionFlag;
@end

@implementation UIControl (YYSeriesEvent)

+ (void)load {
    Method originFun = class_getInstanceMethod(self, @selector(sendAction:to:forEvent:));
    Method exchangeFun = class_getInstanceMethod(self, @selector(yy_sendAction:to:forEvent:));
    
    method_exchangeImplementations(originFun, exchangeFun);
}

- (void)yy_sendAction:(SEL)action to:(nullable id)target forEvent:(nullable UIEvent *)event {
    if (self.yy_isPreventSeriesEvent == NO) {
        [self yy_doAction:action to:target];
    } else {
        if (self.yy_isDoActionFlag == NO) {
            self.yy_doActionFlag = YES;
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(self.yy_preventInterval * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                self.yy_doActionFlag = NO;
            });
            [self yy_doAction:action to:target];
        }
    }
}

- (void)yy_doAction:(SEL)action to:(nullable id)target {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    [target performSelector:action withObject:self];
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
