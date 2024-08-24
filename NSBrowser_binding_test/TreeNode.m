//
//  TreeNode.m
//  NSBrowser_binding_test
//
//  Created by Gregory John Casamento on 8/23/24.
//

#import "TreeNode.h"

@implementation TreeNode

- (instancetype) initWithValue:(NSString *)value
{
    self = [super init];
    if (self) {
        self.value = value;
        self.children = [NSMutableArray array];
        self.leaf = NO;
    }
    return self;
}

- (instancetype) copyWithZone:(NSZone *)zone
{
    TreeNode *copy = [[TreeNode alloc] init];
    
    copy.value = self.value;
    copy.children = [NSMutableArray arrayWithArray: self.children];
    copy.leaf = self.leaf;
    
    return copy;
}

- (NSString *) description
{
  return [NSString stringWithFormat: @"%@ = <%@, %@, %@>",
           [super description], _value, _children, (_leaf?@"YES":@"NO")];
}

@end
