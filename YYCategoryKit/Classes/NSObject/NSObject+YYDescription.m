//
//  NSObject+YYDescription.m
//  YYCategory
//
//  Created by SMCB on 2017/11/17.
//

#import "NSObject+YYDescription.h"
#import <Objc/runtime.h>
#import "NSObject+YYLog.h"

#ifdef YYDescriptionIgnoreSet
#undef YYDescriptionIgnoreSet
#endif
#define YYDescriptionIgnoreSet [NSSet setWithObjects:@"UIResponder", @"CALayer", @"UIImage", @"NSSet", nil]


@implementation NSObject (YYDescription)

- (NSString *)debugDescription {
    // 过滤不处理的类型
    for (NSString *s in YYDescriptionIgnoreSet) {
       if ([self isKindOfClass:NSClassFromString(s)]) return self.description;
    }
    
    // 处理常用集合类型
    if ([self isKindOfClass:[NSDictionary class]] || [self isKindOfClass:[NSArray class]]) {
        return [self yylog];
    }
    
    // 处理自定义Model
    NSDictionary *dict = [self getAllPropertiesAndVaules];
    if (dict.count == 0) return self.description;
    NSString *allPropertiesStr = [dict yylog];
    return [self.description stringByAppendingFormat:@"\n%@", allPropertiesStr];
}

/* 获取对象的所有属性和属性内容 */
- (NSDictionary *)getAllPropertiesAndVaules {
    NSMutableDictionary *propsDic = [NSMutableDictionary dictionary];
    unsigned int outCount;
    objc_property_t *properties =class_copyPropertyList([self class], &outCount);
    for ( int i = 0; i<outCount; i++)
    {
        objc_property_t property = properties[i];
        const char* char_f =property_getName(property);
        NSString *propertyName = [NSString stringWithUTF8String:char_f];
        if ([propertyName isEqualToString:@"debugDescription"] ||\
            [propertyName isEqualToString:@"description"]) continue;
        id propertyValue = [self valueForKey:(NSString *)propertyName];
        if (propertyValue) {
            [propsDic setObject:[NSString stringWithFormat:@"%@", propertyValue] forKey:propertyName];
        }
    }
    free(properties);
    return propsDic;
}

@end
