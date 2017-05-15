//
//  Json+Qqc.m
//  QqcFramework
//
//  Created by mahailin on 15/8/7.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import "Json+Qqc.h"

class QqcBaseModel

CF_INLINE NSString *parseObj2JsonString(id obj);
CF_INLINE id parseString2JsonObject(NSString *string);

/**
 *  将object转为json字符串
 *
 *  @param obj 要转化的object
 *
 *  @return 返回json字符串
 */
CF_INLINE NSString *parseObj2JsonString(id obj)
{
    if (!obj)
    {
       return nil;
    }
    
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:obj options:0 error:&error];
    
    if (error != nil)
    {
        return nil;
    }
    
    NSString *qwt_JSONString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return qwt_JSONString;
}

/**
 *  将字符串转为object
 *
 *  @param string 要转化的字符串
 *
 *  @return 返回object
 */
CF_INLINE id parseString2JsonObject(NSString *string)
{
    if (!string || string.length == 0)
    {
        return nil;
    }
    
    NSError *error = nil;
    id obj = [NSJSONSerialization JSONObjectWithData:[string dataUsingEncoding:NSUTF8StringEncoding]
                                             options:0
                                               error:&error];
    return error ? nil : obj;
}

@implementation NSObject (JSONSerializing)

/**
 *  QqcBaseModel实体转为json字符串
 *
 *  @return json字符串
 */
- (NSString *)qwt_JSONString
{
    if ([self isKindOfClass:[NSArray class]]
        || [self isKindOfClass:[NSDictionary class]]) {
        return parseObj2JsonString(self);
    }else if ([self isKindOfClass:[QqcBaseModel class]]) {
        return parseObj2JsonString([((QqcBaseModel*)self) dictionaryValue]);
    }else if ([self isKindOfClass:[NSString class]]) {
        return self;
    }
    
    return nil;
}

@end

@implementation NSArray (JSONSerializing)

/**
 *  数组转为json字符串
 *
 *  @return json字符串
 */
- (NSString *)qwt_JSONString
{
    return parseObj2JsonString(self);
}

@end

@implementation NSDictionary (JSONSerializing)

/**
 *  字典转为json字符串
 *
 *  @return json字符串
 */
- (NSString *)qwt_JSONString
{
    return parseObj2JsonString(self);
}

@end

@implementation NSString (JSONSerializing)

/**
 *  将json字符串转为数组或者字典
 *
 *  @return 数组或者字典
 */
- (id)qwt_JSONObject
{
    return parseString2JsonObject(self);
}

@end
