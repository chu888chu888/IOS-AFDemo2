//
//  AFAppDotNetAPIClient.h
//  AFNetworkingTableDemo
//
//  Created by chuguangming on 15/2/13.
//  Copyright (c) 2015年 chu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPSessionManager.h"
@interface AFAppDotNetAPIClient : AFHTTPSessionManager
+(instancetype)sharedClient;
@end
