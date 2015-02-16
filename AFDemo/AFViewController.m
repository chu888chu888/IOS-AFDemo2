//
//  AFViewController.m
//  AFDemo
//
//  Created by chuguangming on 15/2/4.
//  Copyright (c) 2015年 chu. All rights reserved.
//

#import "AFViewController.h"

#import "AFNetworking.h"
#import "GlobalOperations.h"
#import "ResumeOperations.h"
#import "NoodleClient.h"
#import "AFHTTPRequestSerializer+OAuth2.h"
#import "AFOAuth2Manager.h"
#import "OAuth2Client.h"
#import "ResumeOperations.h"
#import "ResumePost.h"
#import "Resume.h"



@interface AFViewController ()
@property(strong,nonatomic)NSString *returnJsonStr;
@property(strong,nonatomic)NSString *returnAccessToken;
@property(nonatomic) NSArray *returnJson;
@property(nonatomic) AFOAuthCredential *saveCer;
@end

@implementation AFViewController
@synthesize returnJsonStr,returnAccessToken,returnJson,saveCer;

- (void)GetAccessToken {
    /**
     *  实现认证过程
     */
    NSURL *baseURL = [NSURL URLWithString:@"http://121.42.51.177/"];
    AFOAuth2Manager *OAuth2Manager =
    [[AFOAuth2Manager alloc] initWithBaseURL:baseURL
                                    clientID:@"ObpJAwJ7WP4s4Rwd"
                                      secret:@"WMv9vbYIFz8ugpwl6zDNThzn4KLoxLTV"];
    
    [OAuth2Manager authenticateUsingOAuthWithURLString:@"auth/access-token"
                                              username:@"13145877854"
                                              password:@"888888"
                                                 scope:@"student"
                                               success:^(AFOAuthCredential *credential) {
                                                   NSLog(@"Token: %@", credential.accessToken);
                                                   
                                                   //保存证书
                                                   [AFOAuthCredential storeCredential:credential
                                                                       withIdentifier:@"591mian"];
                                                   
                                                   //提取证书
                                                   AFOAuthCredential *credential2 =
                                                   [AFOAuthCredential retrieveCredentialWithIdentifier:@"591mian"];
                                                   
                                                   AFHTTPRequestOperationManager *manager =
                                                   [[AFHTTPRequestOperationManager alloc] initWithBaseURL:baseURL];
                                                   
                                                   [manager.requestSerializer setAuthorizationHeaderFieldWithCredential:credential2];
                                                   
                                                   [manager GET:@"recruitment_info?city=82"
                                                     parameters:nil
                                                        success:^(AFHTTPRequestOperation *operation, id responseObject) {
                                                            NSLog(@"Success: %@", responseObject[@"data"][0]);
                                                            NSLog(@"Success: %@", responseObject[@"data"][0][@"address"]);
                                                        }
                                                        failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                                            NSLog(@"Failure: %@", error);
                                                        }];
                                               }
                                               failure:^(NSError *error) {
                                                   NSLog(@"Error: %@", error);
                                               }];
}

- (void)getrecruitment {
    
    
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
                 NSLog(@"Success: %@", responseObject[@"data"][0]);
                 NSLog(@"Success: %@", responseObject[@"data"][0][@"address"]);
             }
             failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                 NSLog(@"Failure: %@", error);
             }];
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    /*
    NSDictionary *parameters = @{
                                 @"grant_type" :@"password",
                                 @"client_id" : @"ObpJAwJ7WP4s4Rwd",
                                 @"client_secret" : @"WMv9vbYIFz8ugpwl6zDNThzn4KLoxLTV",
                                 @"password" : @"888888",
                                 @"username" : @"13145877854"
                                 };
    
    
    [[NoodleClient sharedClient] postMethod:parameters methodPath:@"auth/access-token" completion:^(NSDictionary *results, NSError *error) {
        if (results) {
            NSLog(@"access_token: %@", results[@"access_token"]);
            
            
        } else {
            NSLog(@"ERROR: %@", error);
        }
    }];
     */
    
    //[self GetAccessToken];
    //[self getrecruitment];
    
    /*
    ResumeOperations *resumeOP=[ResumeOperations new];
    [resumeOP recruitment_info_Method:^(id returnDic, BOOL returnVal) {
        if (returnVal) {
            NSLog(@"返回值:%@",returnDic);
        }
        
    }];
     */
    
    
   
    [ResumePost globalTimelinePostsWithBlock:^(NSArray *posts, NSError *error) {
        if (!error) {
            NSLog(@"回传数据的大小%lu",(unsigned long)[posts count]);
            for (Resume *tmp in posts) {
                NSLog(@"地址信息:%@ 关键字信息:%@ 图片地址:%@",tmp.address,tmp.key_words,tmp.pic_url);
            }
        }
    }];
   
    

    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
