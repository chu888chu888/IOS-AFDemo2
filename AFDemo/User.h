//
//  User.h
//  AFDemo
//
//  Created by chuguangming on 15/2/16.
//  Copyright (c) 2015年 chu. All rights reserved.
//

#import <Foundation/Foundation.h>
extern NSString * const kUserProfileImageDidLoadNotification;

@interface User : NSObject
@property (nonatomic) NSString *grantType;
@property (nonatomic) NSString *userName;
@property (nonatomic) NSString *phone;
@property (nonatomic) NSString *clientdId;
@property (nonatomic) NSString *clientSecret;
@property (nonatomic) NSString *password;
@property (nonatomic) NSString *accessToken;
@property (nonatomic) NSString *tokenType;
@property (nonatomic) NSString *refreshToken;
@property (nonatomic) NSString *gender;
@property (nonatomic) NSString *email;
@property (nonatomic) NSInteger collegeId;
@property (nonatomic) NSString *major;

@property (readonly, nonatomic, assign) NSUInteger userID;
@property (readonly, nonatomic, copy) NSString *username;
@property (readonly, nonatomic, unsafe_unretained) NSURL *avatarImageURL;

- (instancetype)initWithAttributes:(NSDictionary *)attributes;

@end
