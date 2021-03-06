//
//  ResumeOperations.m
//  AFDemo
//
//  Created by chuguangming on 15/2/10.
//  Copyright (c) 2015年 chu. All rights reserved.
//

#import "ResumeOperations.h"
#import "AFNetworking.h"
#import "OAuth2Client.h"
#import "AFHTTPSessionManager.h"
#import "OAuth2Client.h"
@implementation ResumeOperations
@synthesize ReturnVal;
//请求宣讲会方法
- (void)recruitment_info_Method:(void (^)(id returnDic,BOOL returnVal))completion {
    OAuth2Client *oauth=[OAuth2Client new];
    [oauth GetAccessToken:@"13145877854" password:@"888888" :^(AFOAuthCredential *accesstoken, NSError *error) {
        NSLog(@"证书:%@",accesstoken.accessToken);
        
        NSURL *baseURL = [NSURL URLWithString:@"http://121.42.51.177/"];
        AFHTTPRequestOperationManager *manager =
        [[AFHTTPRequestOperationManager alloc] initWithBaseURL:baseURL];
        
        [manager.requestSerializer setAuthorizationHeaderFieldWithCredential:accesstoken];
        
        [manager GET:@"recruitment_info?city=82"
          parameters:nil
             success:^(AFHTTPRequestOperation *operation, id responseObject) {
                 //NSLog(@"Success: %@", responseObject[@"data"][0]);
                 //NSLog(@"Success: %@", responseObject[@"data"][0][@"address"]);
                 if (completion) {
                     completion(responseObject,true);
                 }
                 
             }
             failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                 NSLog(@"Failure: %@", error);
                 if (completion) {
                     completion(nil,false);
                 }
             }];
    }];
}

@end
