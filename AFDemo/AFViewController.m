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
                                                  
                                                   AFHTTPRequestOperationManager *manager =
                                                   [[AFHTTPRequestOperationManager alloc] initWithBaseURL:baseURL];
                                                 
                                                   [manager.requestSerializer setAuthorizationHeaderFieldWithCredential:credential];
                                                   
                                                   [manager GET:@"recruitment_info?city=82"
                                                     parameters:nil
                                                        success:^(AFHTTPRequestOperation *operation, id responseObject) {
                                                            NSLog(@"Success: %@", responseObject);
                                                        }
                                                        failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                                            NSLog(@"Failure: %@", error);
                                                        }];
                                               }
                                               failure:^(NSError *error) {
                                                   NSLog(@"Error: %@", error);
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
