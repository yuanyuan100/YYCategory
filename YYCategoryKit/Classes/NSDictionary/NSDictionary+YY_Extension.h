//
//  NSDictionary+YY_Extension.h
//  SMCBProjcet
//
//  Created by SMCB on 2017/11/24.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString * const YY_NSDictionary_Params_End;

@interface NSDictionary (YY_Extension)
/// when Object is ni or Key is nil, won't crash! only param is YY_NSDictionary_Params_End
/// warming: 多参数结束时,必须添加 YY_NSDictionary_Params_End, 否则将crash!!!
/// 本来想多参数后面直接在编译期间强制增加一个结束参数,用作结束判断,奈何技术所限,求指教 微信号:quanquan_pyy
+ (instancetype)yy_dictionaryWithObjectsAndKeys:(id)firstObject, ...;
@end
