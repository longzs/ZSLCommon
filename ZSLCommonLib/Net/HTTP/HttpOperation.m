//
//  HttpOperation.m
//  ZSLCommonLib
//
//  Created by zhoushaolong on 15/9/29.
//  Copyright (c) 2015年 zsl. All rights reserved.
//

#import "HttpOperation.h"

@implementation HttpOperation

+(HttpOperation*)httpOperationWithRequestModel:(ReqBaseModel*)reqModel{
    HttpOperation *ho = [[HttpOperation alloc] init];
    ho.reqModel = reqModel;
    return ho;
}

@end
