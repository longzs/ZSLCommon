//
//  ReqBaseModel.m
//  ZSLCommonLib
//
//  Created by zhoushaolong on 15/9/29.
//  Copyright (c) 2015年 zsl. All rights reserved.
//

#import "ReqBaseModel.h"
#import <objc/objc-runtime.h>

@implementation ReqBaseModel

- (instancetype)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

//返回接口名，非空
- (NSString *)serverInterfaceName
{
    return nil;
}

- (NSURL *)requestURL{
    return [NSURL URLWithString:@"http://www.cocoachina.com/news/"];
}

-(HttpMethod)httpMethod{
    return HTTP_METHOD_GET;
}

-(Class)responseModelClass{
    
    return [RspBaseModel class];
}

-(NSData*)postHttpBody{
    
    return nil;
}

-(ResponseDataType)responseDataType{
    
    return ResponseDataType_Json;
}

-(NSMutableDictionary*)userInfoDictionary{
    return [NSMutableDictionary dictionaryWithObject:[NSNumber numberWithBool:YES] forKey:@"LogResult"];
}

-(NSData*)decodeResponseData:(NSData*)responseData{
    
    return nil;
}

+ (BOOL)ignoreWithPorpertyName:(NSString *)propertyName properts:(NSArray*)properts
{
    return [properts containsObject:propertyName];
}

+ (NSArray*)ignorePorpertyNames{
    return nil;
}

#pragma mark - printLog
-(void)printRequestSuccess{
    
}

-(void)printRequestError{
    
}

-(void)printResonse{
    
}

#pragma mark - old kept

// 继承实现valueForUndefinedKey  防止未定义属性异常
- (id)valueForUndefinedKey:(NSString *)key{
    NSLog(@"valueForUndefinedKey : %@", key);
    
    return @"valueForUndefine";
}

//相应的类型，默认为空
- (NSString *)responseClassName
{
    return @"";
}

-(NSMutableDictionary*)toMutableDictionary{
    
    NSMutableDictionary* dic = [NSMutableDictionary dictionaryWithCapacity:0];
    
    unsigned int outCount = 0;
    Class cls = self.class;
    while (cls != [NSObject class]) {
        objc_property_t* propertys = class_copyPropertyList(cls, &outCount);
        
        for (int i = 0; i < outCount; ++i) {
            objc_property_t property = propertys[i];
            const char* propertyName = property_getName(property);
            
            if (nil != propertyName) {
            
                NSString *strPropertyName = [NSString stringWithUTF8String:propertyName];
                //是否需要忽略
                if ([cls ignoreWithPorpertyName:strPropertyName properts:[cls ignorePorpertyNames]]) {
                    continue;
                }
                id value = [self valueForKey:strPropertyName];
                dic[@(propertyName)] = (nil == value)?@"":value;
            }
        }
        free(propertys);
        cls = class_getSuperclass(cls);
    }
    return dic;
}


@end
