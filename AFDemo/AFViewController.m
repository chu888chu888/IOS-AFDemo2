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
@interface AFViewController ()
@property(strong,nonatomic)NSString *returnJsonStr;
@property(strong,nonatomic)NSString *returnAccessToken;
@property(nonatomic) NSArray *returnJson;
@end

@implementation AFViewController
@synthesize returnJsonStr,returnAccessToken,returnJson;

- (void)viewDidLoad {
    [super viewDidLoad];
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
