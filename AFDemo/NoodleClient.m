//
//  NoodleClient.m
//  AFDemo
//
//  Created by chuguangming on 15/2/11.
//  Copyright (c) 2015年 chu. All rights reserved.
//

#import "NoodleClient.h"

@implementation NoodleClient
/**
 *  单例模式
 *
 *  @return 返回一个AFHTTPSessionManager的实例
 */
+ (NoodleClient *)sharedClient {
    static NoodleClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        NSURL *baseURL = [NSURL URLWithString:@"http://121.42.51.177/"];
        
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        [config setHTTPAdditionalHeaders:@{ @"User-Agent" : @"chrome"}];
        
        //设置我们的缓存大小 其中内存缓存大小设置10M  磁盘缓存5M
        NSURLCache *cache = [[NSURLCache alloc] initWithMemoryCapacity:10 * 1024 * 1024
                                                          diskCapacity:50 * 1024 * 1024
                                                              diskPath:nil];
        
        [config setURLCache:cache];
        
        _sharedClient = [[NoodleClient alloc] initWithBaseURL:baseURL
                                         sessionConfiguration:config];
        
        
        
        _sharedClient.requestSerializer = [AFHTTPRequestSerializer serializer];
        [_sharedClient.requestSerializer setValue:@"application/vnd.591m.v1+json" forHTTPHeaderField:@"Accept"];
        [_sharedClient.requestSerializer setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
        
        _sharedClient.responseSerializer = [AFJSONResponseSerializer serializer];
        _sharedClient.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
        
    });
    
    return _sharedClient;
}
- (NSURLSessionDataTask *)postMethod:(NSDictionary *)parms methodPath:(NSString*)paths completion:( void (^)(NSDictionary *results, NSError *error) )completion
{
    NSURLSessionDataTask *task = [self POST:paths parameters:parms success:^(NSURLSessionDataTask *task, id responseObject) {
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)task.response;
        //NSLog(@"Received: %@", responseObject);
        //NSLog(@"Received HTTP %ld", (long)httpResponse.statusCode);
        if (httpResponse.statusCode == 200) {
                completion(responseObject, nil);
        } else
        {
            dispatch_async(dispatch_get_main_queue(), ^{
                completion(nil, nil);
        });

        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"Error:%@",error);
    }];
    return task;
}

- (NSURLSessionDataTask *)getMethod:(NSDictionary *)parms methodPath:(NSString*)paths completion:( void (^)(NSDictionary *results, NSError *error) )completion
{
    NSURLSessionDataTask *task = [self GET:paths parameters:parms success:^(NSURLSessionDataTask *task, id responseObject) {
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)task.response;
        //NSLog(@"Received: %@", responseObject);
        //NSLog(@"Received HTTP %ld", (long)httpResponse.statusCode);
        if (httpResponse.statusCode == 200) {
            dispatch_async(dispatch_get_main_queue(), ^{
                completion(responseObject, nil);
            });
        } else
        {
            dispatch_async(dispatch_get_main_queue(), ^{
                completion(nil, nil);
            });
            
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"Error:%@",error);
    }];
    return task;
}

@end
