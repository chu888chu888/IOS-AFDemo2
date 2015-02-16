//
//  PostTableViewCell.m
//  AFNetworkingTableDemo
//
//  Created by chuguangming on 15/2/13.
//  Copyright (c) 2015年 chu. All rights reserved.
//

#import "PostTableViewCell.h"
#import "Post.h"
#import "User.h"
#import "UIImageView+AFNetworking.h"

@implementation PostTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (!self) {
        return nil;
    }
    self.textLabel.adjustsFontSizeToFitWidth=YES;
    self.textLabel.textColor=[UIColor darkGrayColor];
    self.detailTextLabel.font=[UIFont systemFontOfSize:12.0f];
    self.detailTextLabel.numberOfLines=0;
    self.selectionStyle=UITableViewCellSelectionStyleGray;
    return self;
}
-(void)setPost:(Post *)post
{
    _post=post;
    self.textLabel.text=_post.user.username;
    self.detailTextLabel.text=_post.text;
    [self.imageView setImageWithURL:_post.user.avatarImageURL placeholderImage:[UIImage imageNamed:@"profile-image-placeholder"]];
    [self setNeedsLayout];
    
}
+ (CGFloat)heightForCellWithPost:(Post *)post {
    return (CGFloat)fmaxf(70.0f, (float)[self detailTextHeight:post.text] + 45.0f);
}

+ (CGFloat)detailTextHeight:(NSString *)text {
    CGRect rectToFit = [text boundingRectWithSize:CGSizeMake(240.0f, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:12.0f]} context:nil];
    return rectToFit.size.height;
}
#pragma mark - UIView

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.imageView.frame = CGRectMake(10.0f, 10.0f, 50.0f, 50.0f);
    self.textLabel.frame = CGRectMake(70.0f, 6.0f, 240.0f, 20.0f);
    
    CGRect detailTextLabelFrame = CGRectOffset(self.textLabel.frame, 0.0f, 25.0f);
    CGFloat calculatedHeight = [[self class] detailTextHeight:self.post.text];
    detailTextLabelFrame.size.height = calculatedHeight;
    self.detailTextLabel.frame = detailTextLabelFrame;
}


@end
