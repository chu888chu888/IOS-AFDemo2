//
//  LoginViewController.m
//  AFDemo
//
//  Created by chuguangming on 15/2/6.
//  Copyright (c) 2015年 chu. All rights reserved.
//

#import "LoginViewController.h"
#import "AccountOperations.h"
#import "User.h"
#import "NoodleClient.h"
#import "MBProgressHUD.h"
#import "AFHTTPRequestSerializer+OAuth2.h"
#import "AFOAuth2Manager.h"
@interface LoginViewController ()

@end

@implementation LoginViewController

-(void) loadView {
    self.view = [LoginView new];
    [self.view.loginBtn addTarget:self action:@selector(loginHandle) forControlEvents:UIControlEventTouchUpInside];
    [self.view.registerBtn addTarget:self action:@selector(registerHandle) forControlEvents:UIControlEventTouchUpInside];
    [self.view.findBtn addTarget:self action:@selector(findHandle) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void) viewDidLoad {
    [super viewDidLoad];
    self.title = @"登录";
    [self.view.nameText becomeFirstResponder];
    self.view.nameText.text=@"13145877854";
    self.view.passwordText.text=@"888888";
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

#pragma mark 界面控件事件
-(void)loginHandle {
    
    /*
    //一段原生态实现登录的过程
    NSDictionary *parameters = @{
                                 @"grant_type" :@"password",
                                 @"client_id" : @"ObpJAwJ7WP4s4Rwd",
                                 @"client_secret" : @"WMv9vbYIFz8ugpwl6zDNThzn4KLoxLTV",
                                 @"password" : self.view.passwordText.text,
                                 @"username" : self.view.nameText.text
                                 };
    
    [[NoodleClient sharedClient] POST:@"auth/access-token" parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        NSLog(@"%@",responseObject[@"access_token"]);
        //拼接Authorization认证头
        NSString *strAuthorization=[NSString stringWithFormat:@"Bearer %@",responseObject[@"access_token"]];
        NSLog(@"%@",strAuthorization);
        //获取用户信息
        [[NoodleClient sharedClient].requestSerializer setValue:strAuthorization forHTTPHeaderField:@"Authorization"];
        
        [[NoodleClient sharedClient] GET:@"user" parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
            NSLog(@"userinfo:%@",responseObject);
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            NSLog(@"error:%@",error);
        }];
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"%@",error);
        UIAlertView *promptAlert = [[UIAlertView alloc] initWithTitle:@"提示:" message:@"登录失败!" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [promptAlert show];
    }];
     */
    
    /*
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
                                                            NSLog(@"Success: %@", responseObject);
                                                        }
                                                        failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                                            NSLog(@"Failure: %@", error);
                                                        }];
                                               }
                                               failure:^(NSError *error) {
                                                   NSLog(@"Error: %@", error);
                                               }];
     */

}

-(void)registerHandle{
    NSLog(@"注册");

}

-(void)findHandle{
    NSLog(@"忘记密码");
}


@end
