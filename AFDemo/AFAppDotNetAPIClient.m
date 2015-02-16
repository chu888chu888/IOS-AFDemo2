//
//  AFAppDotNetAPIClient.m
//  AFNetworkingTableDemo
//
//  Created by chuguangming on 15/2/13.
//  Copyright (c) 2015年 chu. All rights reserved.
//

#import "AFAppDotNetAPIClient.h"
static NSString *const AFAppDotNetAPIBaseURLString=@"https://api.app.net";
@implementation AFAppDotNetAPIClient
+(instancetype)sharedClient
{
    static AFAppDotNetAPIClient * _shareClient=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shareClient=[[AFAppDotNetAPIClient alloc] initWithBaseURL:[NSURL URLWithString:AFAppDotNetAPIBaseURLString]];
        _shareClient.securityPolicy=[AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    });
    return _shareClient;
}
@end
