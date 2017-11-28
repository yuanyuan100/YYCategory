//
//  NSObject+YYLog.m
//  SMCBProjcet
//
//  Created by SMCB on 2017/11/17.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "NSObject+YYLog.h"

@implementation NSObject (YYLog)
- (NSString *)yylog {
    if ([self isKindOfClass:[NSDictionary class]]) {
        return [self yyDataToJsonStringWithObject:self];
    } else if ([self isKindOfClass:[NSArray class]]) {
        return [self yyDataToJsonStringWithObject:self];
    } else if ([self isKindOfClass:[NSString class]]) {
        return (NSString *)self;
    } else {
        return [NSString stringWithFormat:@"%@", self];
    }
}

- (NSString *)yyDataToJsonStringWithObject:(id)object {
    NSError *error;
    id jsonData;
    @try {
       jsonData = [NSJSONSerialization dataWithJSONObject:object options:NSJSONWritingPrettyPrinted error:&error];
    } @catch (NSException *e) {
        error = [NSError errorWithDomain:e.reason code:0 userInfo:e.userInfo];
    } @finally {
        if (error) {
            NSLog(@"error-->%@", error);
            return @"call [object description]";
        } else {
            NSString *jsonStr = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
            return jsonStr;
        }
    }
}
@end
