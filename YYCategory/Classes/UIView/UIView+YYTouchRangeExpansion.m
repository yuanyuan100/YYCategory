//
//  UIView+YYTouchRangeExpansion.m
//  Pods
//
//  Created by Mr.Pyy on 2017/7/11.
//
//

#import "UIView+YYTouchRangeExpansion.h"
#import <Objc/runtime.h>

NS_ASSUME_NONNULL_BEGIN

static void *YYTouchRangeExpansionJudge = &YYTouchRangeExpansionJudge;
static void *YYTouchRangeExpansionEdge = &YYTouchRangeExpansionEdge;

@implementation UIView (YYTouchRangeExpansion)

- (BOOL)pointInside:(CGPoint)point withEvent:(nullable UIEvent *)event {
    
    if (self.yy_isExtendedTouch == YES) {
        
        // 扩大点击范围
        CGRect bounds = self.bounds;
        if (UIEdgeInsetsEqualToEdgeInsets(UIEdgeInsetsZero, self.yy_extendedTouchEdge) == true) {
            
            // 进行默认扩大
            if (bounds.size.width < 44.f) {
                bounds = CGRectMake(bounds.origin.x, bounds.origin.y, 44.f, bounds.size.height);
            }
            
            if (bounds.size.height < 44.f) {
                bounds = CGRectMake(bounds.origin.x, bounds.origin.y, bounds.size.width, 44.f);
            }
            
        } else {
            
            bounds = UIEdgeInsetsInsetRect(bounds, self.yy_extendedTouchEdge);
            
        }
        
        return CGRectContainsPoint(bounds, point);
        
    } else {
        
        // 不扩大点击范围
        return CGRectContainsPoint(self.bounds, point);
        
    }
    
}

#pragma mark -------- getter or setter
- (BOOL)yy_isExtendedTouch {
    id isExtendedTouch = objc_getAssociatedObject(self, YYTouchRangeExpansionJudge);
    return [(NSNumber *)isExtendedTouch boolValue];
}


- (void)setYy_extendedTouch:(BOOL)yy_extendedTouch {
    if (self.yy_isExtendedTouch != yy_extendedTouch) {
       objc_setAssociatedObject(self, YYTouchRangeExpansionJudge, [NSNumber numberWithBool:yy_extendedTouch], OBJC_ASSOCIATION_ASSIGN);
    }
}


- (UIEdgeInsets)yy_extendedTouchEdge {
    id edge = objc_getAssociatedObject(self, YYTouchRangeExpansionEdge);
    if (edge == nil) return  UIEdgeInsetsZero;
    return [(NSValue *)edge UIEdgeInsetsValue];
}


- (void)setYy_extendedTouchEdge:(UIEdgeInsets)yy_extendedTouchEdge {
    if (UIEdgeInsetsEqualToEdgeInsets(self.yy_extendedTouchEdge, yy_extendedTouchEdge) == false) {
        objc_setAssociatedObject(self, YYTouchRangeExpansionEdge, [NSValue valueWithUIEdgeInsets:yy_extendedTouchEdge], OBJC_ASSOCIATION_COPY_NONATOMIC);
    }
}
@end

NS_ASSUME_NONNULL_END
