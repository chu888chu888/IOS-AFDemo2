//
//  PostTableViewCell.h
//  AFNetworkingTableDemo
//
//  Created by chuguangming on 15/2/13.
//  Copyright (c) 2015年 chu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Post;
@interface PostTableViewCell : UITableViewCell
@property(nonatomic,strong) Post *post;
+(CGFloat) heightForCellWithPost:(Post *)post;
@end
