
#import <Foundation/Foundation.h>

@class Resume;

@interface ResumePost : NSObject

- (instancetype)initWithAttributes:(NSDictionary *)attributes;

+ (void)globalTimelinePostsWithBlock:(void (^)(NSArray *posts, NSError *error))block;

@end
