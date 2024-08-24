//
//  AppDelegate.m
//  NSBrowser_binding_test
//
//  Created by Gregory John Casamento on 8/23/24.
//

#import "AppDelegate.h"
#import "TreeNode.h"

@interface AppDelegate ()

@property (strong) IBOutlet NSWindow *window;
@property (strong) IBOutlet NSTreeController *controller;
@property (strong) NSArray *nodes;
@property (strong) NSMutableArray *selectionIndexPaths;

@property (strong) IBOutlet NSBrowser *browser;

@end

@implementation AppDelegate

- (NSArray *) buildNodes
{
    TreeNode *node = [[TreeNode alloc] init];
    node.value = @"Root";
    node.leaf = NO;
    NSArray *array = [NSArray arrayWithObject: node];
  
    TreeNode *child = [[TreeNode alloc] init];
    child.value = @"Child 0";
    child.leaf = NO;
    node.children = [NSMutableArray arrayWithObject: child];
    node.count = [node.children count];

    TreeNode *newChild0 = [[TreeNode alloc] init];
    newChild0.value = @"Subchild 0";
    newChild0.leaf = YES;
    child.children = [NSMutableArray arrayWithObject: newChild0];
    child.count = [child.children count];
    newChild0.count = 0;
    
    return array;
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    self.nodes = [self buildNodes];
    NSString *cn = [self.controller.arrangedObjects className];
    NSString *sc = NSStringFromClass([[self.controller.arrangedObjects class] superclass]);
    NSLog(@"arrangedObjects = %@, className = %@, superClass = %@",
          self.controller.arrangedObjects, cn, sc);
    NSLog(@"representedObject = %@" /*, value = %@" */, self.controller.arrangedObjects.representedObject); // ,
    // self.treeController.arrangedObjects.representedObject.value);
    NSLog(@"objectClassName = %@", [self.controller objectClass]);
    NSLog(@"newObject = %@", [self.controller newObject]);
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


- (BOOL)applicationSupportsSecureRestorableState:(NSApplication *)app {
    return YES;
}


@end
