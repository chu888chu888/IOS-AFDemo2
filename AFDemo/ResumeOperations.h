//
//  ResumeOperations.h
//  AFDemo
//
//  Created by chuguangming on 15/2/10.
//  Copyright (c) 2015年 chu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GlobalOperations.h"
@interface ResumeOperations : NSObject
- (void)recruitment_info_Method:(void (^)(id returnDic,BOOL returnVal))completion;
@property(nonatomic) id ReturnVal;
@end
