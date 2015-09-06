//
//  ZSLLibMacro.h
//  ZSLCommonLib
//
//  Created by zhoushaolong on 15/8/27.
//  Copyright (c) 2015年 zsl. All rights reserved.
//

#ifndef ZSLCommonLib_ZSLLibMacro_h
#define ZSLCommonLib_ZSLLibMacro_h

#define weakSelf(wSelf)    __weak __typeof(self)wSelf = self

#pragma mark - 工程设置
#define kUseAESEncode        1          //使用AES加密网络数据
#define kAESKey     @"jiankangwuyouabc" //ASE加密算法的Key

#pragma mark - 平台id
// IOS 平台ID
#define k_PlatID_IOS                     @"01"

typedef NSString* ServerInterfaceName;

//用户打开终端时，由终端调用该接口
#define k_URL_terminalSignIn             @"terminalSignIn"

//身份信息验证
#define k_URL_IsUserRegister              @"isUserRegister"

typedef NS_ENUM (int, EData){
    
};

//医院支持的支付类型
typedef NS_OPTIONS(NSUInteger, EOptionsType) {
    EOptionsType1                   = 0,        //
    EOptionsType2                   = 1 << 0,   //
    EOptionsType3                   = 1 << 1,   //
    EOptionsType4                   = 1 << 2,   //
    EOptionsType5                   = 1 << 3,   //
    EOptionsType6                   = 1 << 4,   //
};

#endif
