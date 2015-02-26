//
//  Resume.m
//  AFDemo
//
//  Created by chuguangming on 15/2/16.
//  Copyright (c) 2015年 chu. All rights reserved.
//

#import "Resume.h"
#import "AFHTTPRequestOperation.h"
@implementation Resume
@synthesize address,key_words,pic_url,enterprise_name;
- (instancetype)initWithAttributes:(NSDictionary *)attributes {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    self.address =[attributes valueForKeyPath:@"address"];
    self.key_words = [attributes valueForKeyPath:@"key_words"];
    self.pic_url = [attributes valueForKeyPath:@"pic_url"];
    self.enterprise_name=[attributes valueForKeyPath:@"enterprise_name"];
    
    return self;
}
@end
