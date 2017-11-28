//
//  NSDictionary+YY_Extension.m
//  SMCBProjcet
//
//  Created by SMCB on 2017/11/24.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "NSDictionary+YY_Extension.h"

NSString * const YY_NSDictionary_Params_End = @"YY_NSDictionary_Params_End_10001";

@implementation NSDictionary (YY_Extension)

+ (instancetype)yy_dictionaryWithObjectsAndKeys:(id)firstObject, ... {
    
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    
    id object;
    va_list argumentList;
    if (firstObject) {
        va_start(argumentList, firstObject);
        object = va_arg(argumentList, id);
        
        int i = 1;
        id<NSCopying> key = nil;
        id value = firstObject;
        while ([[NSString stringWithFormat:@"%@", object] isEqualToString:YY_NSDictionary_Params_End] == NO) {
            if (i % 2 == 0) {
                // value
                value = object;
                
                i = 0;
            } else {
                // key
                key = object;
                
                if (key != nil && value != nil) {
                    [dict setObject:value forKey:key];
                }
             
                key = nil;
                value = nil;
            }
            
            i++;
            object = va_arg(argumentList, id);
        }
        va_end(argumentList);
    }
    
    return [dict copy];
}
@end
