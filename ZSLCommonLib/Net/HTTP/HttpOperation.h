//
//  HttpOperation.h
//  ZSLCommonLib
//
//  Created by zhoushaolong on 15/9/29.
//  Copyright (c) 2015年 zsl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ReqBaseModel.h"
#import "ReqUploadModel.h"
#import "CommonMacro.h"

@interface HttpOperation : NSObject

@property(nonatomic, assign)int    requestId;
@property(nonatomic, strong)ReqBaseModel* reqModel;

//  http 返回码(eg:200)
@property(nonatomic, strong)NSError*             httpError;

+(HttpOperation*)httpOperationWithRequestModel:(ReqBaseModel*)reqModel;

@end
