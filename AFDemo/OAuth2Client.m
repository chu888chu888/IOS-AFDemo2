//
//  OAuth2Client.m
//  AFDemo
//
//  Created by chuguangming on 15/2/16.
//  Copyright (c) 2015年 chu. All rights reserved.
//

#import "OAuth2Client.h"
#import "AFHTTPSessionManager.h"
//API根路径
static NSString *const APIBaseURLString=@"http://121.42.51.177/";
//证书保存ID
static NSString *const CredentialIdentifier=@"591mian";
@implementation OAuth2Client:NSObject
@synthesize AccessToken;

-(void)GetAccessToken:(NSString *)username password:(NSString *)password :(void (^)(AFOAuthCredential * accesstoken, NSError * error))block

{

        NSURL *baseURL = [NSURL URLWithString:APIBaseURLString];
    
        //首先尝试提取ID为591mian的证书,如果为空就申请一个
        //如果不为空那就要判断是不是过期了,如果过期了就用refertoken来获取一个新的accesstoken
    
        AFOAuthCredential *savecredential =
        [AFOAuthCredential retrieveCredentialWithIdentifier:CredentialIdentifier];
    
    if (savecredential==nil) {
        NSLog(@"创建第一个accesstoken");
        AFOAuth2Manager *OAuth2Manager =
        [[AFOAuth2Manager alloc] initWithBaseURL:baseURL
                                        clientID:@"ObpJAwJ7WP4s4Rwd"
                                          secret:@"WMv9vbYIFz8ugpwl6zDNThzn4KLoxLTV"];
        
        [OAuth2Manager authenticateUsingOAuthWithURLString:@"auth/access-token"
                                                  username:username
                                                  password:password
                                                     scope:@"student"
                                                   success:^(AFOAuthCredential *credential) {
                                                       
                                                       AccessToken=credential;
                                                       //保存accesstoken
                                                       [AFOAuthCredential storeCredential:credential
                                                                           withIdentifier:CredentialIdentifier];
                                                       if (block) {
                                                           block(AccessToken, nil);
                                                       }
                                                       
                                                   }
                                                   failure:^(NSError *error) {
                                                       if (block) {
                                                           NSLog(@"Error: %@", error);
                                                           block(nil,error);
                                                       }
                                                       
                                                   }];

    }
    else
    {
        
        AFOAuthCredential *returncredential =
            [AFOAuthCredential retrieveCredentialWithIdentifier:CredentialIdentifier];
        if (returncredential.isExpired) {
            //证书过期了
            AFOAuth2Manager *OAuth2Manager =
            [[AFOAuth2Manager alloc] initWithBaseURL:baseURL
                                            clientID:@"ObpJAwJ7WP4s4Rwd"
                                              secret:@"WMv9vbYIFz8ugpwl6zDNThzn4KLoxLTV"];
            
            [OAuth2Manager authenticateUsingOAuthWithURLString:@"auth/access-token"
                                                      username:username
                                                      password:password
                                                         scope:@"student"
                                                       success:^(AFOAuthCredential *credential) {
                                                           
                                                           AccessToken=credential;
                                                           //保存accesstoken
                                                           [AFOAuthCredential storeCredential:credential
                                                                               withIdentifier:CredentialIdentifier];
                                                           if (block) {
                                                               block(AccessToken, nil);
                                                           }
                                                           
                                                       }
                                                       failure:^(NSError *error) {
                                                           if (block) {
                                                               NSLog(@"Error: %@", error);
                                                               block(nil,error);
                                                           }
                                                           
                                                       }];
        }
        else
        {
            if (block) {
                block(returncredential, nil);
            }
        }

    }
    
}
@end
