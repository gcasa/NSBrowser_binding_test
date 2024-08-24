//
//  TreeNode.h
//  NSBrowser_binding_test
//
//  Created by Gregory John Casamento on 8/23/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TreeNode : NSObject <NSCopying>

@property (nonatomic, strong) NSString *value;
@property (nonatomic, strong) NSMutableArray *children;
@property (nonatomic) BOOL leaf;
@property (nonatomic) NSUInteger count;
@property (nonatomic) BOOL isEnabled;

- (instancetype)initWithValue:(NSString *)value;

@end

NS_ASSUME_NONNULL_END
