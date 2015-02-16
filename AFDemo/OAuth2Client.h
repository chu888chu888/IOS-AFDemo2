//
//  OAuth2Client.h
//  AFDemo
//
//  Created by chuguangming on 15/2/16.
//  Copyright (c) 2015年 chu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPRequestSerializer+OAuth2.h"
#import "AFOAuth2Manager.h"

@interface OAuth2Client : NSObject
-(void)GetAccessToken:(NSString *)username password:(NSString *)password :(void (^)(AFOAuthCredential * accesstoken, NSError * error))block;
@property(nonatomic)AFOAuthCredential *AccessToken;
@end
