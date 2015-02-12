//
//  NoodleClient.h
//  AFDemo
//
//  Created by chuguangming on 15/2/11.
//  Copyright (c) 2015年 chu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPSessionManager.h"

@interface NoodleClient : AFHTTPSessionManager
+ (NoodleClient *)sharedClient;
- (NSURLSessionDataTask *)postMethod: (NSDictionary *)parms methodPath:(NSString*)paths completion:( void (^)(NSDictionary *results, NSError *error) )completion;
- (NSURLSessionDataTask *)getMethod: (NSDictionary *)parms methodPath:(NSString*)paths completion:( void (^)(NSDictionary *results, NSError *error) )completion;

@end
