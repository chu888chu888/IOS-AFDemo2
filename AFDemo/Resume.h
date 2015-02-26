//
//  Resume.h
//  AFDemo
//
//  Created by chuguangming on 15/2/16.
//  Copyright (c) 2015年 chu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Resume : NSObject
@property(nonatomic) NSString *address;
@property(nonatomic) NSString *key_words;
@property (nonatomic) NSString *pic_url;
@property(nonatomic) NSString *enterprise_name;

- (instancetype)initWithAttributes:(NSDictionary *)attributes;
@end
