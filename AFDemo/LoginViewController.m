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
    //首先获取access_token,之后拼接出Authorization,获取用户信息之后跳转
    //需要找一个封装coreData的库,这样操作太麻烦了
    
   /*
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
        NSString *strAuthorization=[NSString stringWithFormat:@"%@ %@",@"Bearer",responseObject[@"access_token"]];

        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"%@",error);
        UIAlertView *promptAlert = [[UIAlertView alloc] initWithTitle:@"提示:" message:@"登录失败!" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [promptAlert show];
    }];
    */
    
    /*
    [[NoodleClient sharedClient].requestSerializer setValue:@"Bearer 5kohZt9nZNVvxWbZWOEPjFslZNPwtcB5SMLNr0uA" forHTTPHeaderField:@"Authorization"];
    
    [[NoodleClient sharedClient] GET:@"user" parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        NSLog(@"userinfo:%@",responseObject);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"error:%@",error);
    }];
    */

    
    
    
    
    /*
    ConnectionFactory *connectionFactory = [[ConnectionFactory alloc] init];
    ObjectRequestSuccess success = ^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult){
        User *user = [mappingResult firstObject];
        NSString *token = [NSString stringWithFormat:@"%@ %@",user.tokenType,user.accessToken];
        [[NSUserDefaults standardUserDefaults] setObject:token forKey:@"accessToken"];
        [[NSUserDefaults standardUserDefaults] setObject:user.refreshToken  forKey:@"refreshToken"];
        Connection *connection = [[Connection alloc] initWithAccessToken:token];
        self.appDelegate.noodleApi = [connection getApi];
        
        [self getUserInfo];
    };
    
    ObjectRequestFailure failue = ^(RKObjectRequestOperation *operation, NSError *error){
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
        UIAlertView *promptAlert = [[UIAlertView alloc] initWithTitle:@"提示:" message:@"登录失败!" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [promptAlert show];
        
        NSLog(@"%@", [[APIError alloc] initWithResponseError:error]);
    };
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [connectionFactory createConnectionWithName:self.view.nameText.text andPassword:self.view.passwordText.text success:success failure:failue];
     */
}

-(void)registerHandle{
    NSLog(@"注册");

}

-(void)findHandle{
    NSLog(@"忘记密码");
}


@end
