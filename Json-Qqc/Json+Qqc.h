//
//  Json+Qqc.h
//  QqcFramework
//
//  Created by mahailin on 15/8/7.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  将QqcBaseModel实体转换为json字符串类别
 */
@interface NSObject (JSONSerializing)

/**
 *  QqcBaseModel实体转为json字符串
 *
 *  @return json字符串
 */
- (NSString *)qwt_JSONString;

@end

/**
 *  将数组转换为json字符串类别
 */
@interface NSArray (JSONSerializing)

/**
 *  数组转为json字符串
 *
 *  @return json字符串
 */
- (NSString *)qwt_JSONString;

@end

/**
 *  将字典转换为json字符串类别
 */
@interface NSDictionary (JSONSerializing)

/**
 *  字典转为json字符串
 *
 *  @return json字符串
 */
- (NSString *)qwt_JSONString;

@end

@interface NSString (JSONSerializing)

/**
 *  将json字符串转为数组或者字典
 *
 *  @return 数组或者字典
 */
- (id)qwt_JSONObject;

@end
