#import "ResumePost.h"
#import "Resume.h"
#import "ResumeOperations.h"
#import "OAuth2Client.h"
@implementation ResumePost
-(instancetype)initWithAttributes:(NSDictionary *)attributes
{
    self=[super init];
    if (!self) {
        return nil;
    }
    return self;
}
+(void)globalTimelinePostsWithBlock:(void (^)(NSArray *posts, NSError *))block
{
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

                 NSArray *postsFromResponse = responseObject[@"data"];
                 NSMutableArray *mutablePosts = [NSMutableArray arrayWithCapacity:[postsFromResponse count]];
                 for (NSDictionary *attributes in postsFromResponse) {
                     Resume *resume = [[Resume alloc] initWithAttributes:attributes];
                     [mutablePosts addObject:resume];
                 }
                 
                 if (block) {
                     block([NSArray arrayWithArray:mutablePosts], nil);
                 }
                 
                 
             }
             failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                 NSLog(@"Failure: %@", error);
                 if (block) {
                     block(nil,error);
                 }
             }];
    }];
}
@end