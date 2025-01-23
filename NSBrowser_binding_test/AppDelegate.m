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
@property (strong) IBOutlet NSTreeController *controller2;
@property (strong) NSArray *nodes;
@property (strong) NSArray *nodes2;
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

    TreeNode *child1 = [[TreeNode alloc] init];
    child1.value = @"Child 1";
    child1.leaf = YES;
    node.children = [NSMutableArray arrayWithObjects: child, child1, nil];
    // node.count = [node.children count];

    TreeNode *newChild0 = [[TreeNode alloc] init];
    newChild0.value = @"Subchild 0";
    newChild0.leaf = YES;
    child.children = [NSMutableArray arrayWithObject: newChild0];
    child.count = [child.children count];
    // newChild0.count = 0;
    
    return array;
}

- (NSArray *) buildNodes2
{
    TreeNode *node = [[TreeNode alloc] init];
    node.value = @"RootA";
    node.leaf = NO;
    NSArray *array = [NSArray arrayWithObject: node];
  
    TreeNode *child = [[TreeNode alloc] init];
    child.value = @"Child 0A";
    child.leaf = NO;

    TreeNode *child1 = [[TreeNode alloc] init];
    child1.value = @"Child 1A";
    child1.leaf = YES;
    node.children = [NSMutableArray arrayWithObjects: child, child1, nil];
    // node.count = [node.children count];

    TreeNode *newChild0 = [[TreeNode alloc] init];
    newChild0.value = @"Subchild 0A";
    newChild0.leaf = YES;
    child.children = [NSMutableArray arrayWithObject: newChild0];
    child.count = [child.children count];
    // newChild0.count = 0;
    
    return array;
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    self.nodes = [self buildNodes];
    self.nodes2 = [self buildNodes2];
    
    NSString *cn = [self.controller.arrangedObjects className];
    NSString *sc = NSStringFromClass([[self.controller.arrangedObjects class] superclass]);
    NSLog(@"arrangedObjects = %@, className = %@, superClass = %@",
          self.controller.arrangedObjects, cn, sc);
    NSLog(@"representedObject = %@" /*, value = %@" */, self.controller.arrangedObjects.representedObject); // ,
    // self.treeController.arrangedObjects.representedObject.value);
    NSLog(@"objectClassName = %@", [self.controller objectClass]);
    NSLog(@"newObject = %@", [self.controller newObject]);
    
    // [self.browser setDelegate: self]; // Remove this if we are not testing with a delegate...
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


- (BOOL)applicationSupportsSecureRestorableState:(NSApplication *)app {
    return YES;
}

// Actions...
- (IBAction) showValue: (id)sender
{
    NSArray *selected = [self.browser selectedCells];
    if ([selected count] > 0)
    {
        NSCell *cell = [selected objectAtIndex: 0];
        id obj = [cell objectValue];
        
        NSLog(@"Object value = %@", obj);
    }
}

// Conditional delegate...
- (NSInteger) browser:(NSBrowser *)browser numberOfChildrenOfItem:(id)item
{
    if (item == nil)
    {
        return 1;
    }
    else if ([item isEqualToString: @"NSObject"])
    {
        return 3;
    }
    else if ([item isEqualToString: @"NSArray"])
    {
        return 1;
    }
    else if ([item isEqualToString: @"NSDictionary"])
    {
        return 1;
    }
    else if ([item isEqualToString: @"NSString"])
    {
        return 1;
    }

    return 0;
}

- (id)browser:(NSBrowser *)browser
        child:(NSInteger)index
       ofItem:(id)item
{
    if (item == nil)
    {
        return @"NSObject";
    }
    else if ([item isEqualToString: @"NSObject"])
    {
        if (index == 0)
        {
            return @"NSArray";
        }
        else if (index == 1)
        {
            return @"NSDictionary";
        }
        else if (index == 2)
        {
            return @"NSString";
        }
    }
    else if ([item isEqualToString: @"NSArray"])
    {
        if (index == 0)
        {
            return @"NSMutableArray";
        }
    }
    else if ([item isEqualToString: @"NSDictionary"])
    {
        if (index == 0)
        {
            return @"NSMutableDictionary";
        }
    }
    else if ([item isEqualToString: @"NSString"])
    {
        if (index == 0)
        {
            return @"NSMutableString";
        }
    }

    return nil;
}

- (BOOL)browser:(NSBrowser *)browser
     isLeafItem:(id)item
{
    if ([item isEqualToString: @"NSObject"]
        || [item isEqualToString: @"NSDictionary"]
        || [item isEqualToString: @"NSArray"]
        || [item isEqualToString: @"NSString"])
    {
        return NO;
    }
    
    return YES;
}

- (BOOL)browser:(NSBrowser *)browser
 shouldEditItem:(id)item
{
    return YES;
}

- (id)browser:(NSBrowser *)browser
objectValueForItem:(id)item
{
    return item;
}

- (void)browser:(NSBrowser *)browser
 setObjectValue:(id)object
        forItem:(id)item
{
    NSLog(@"New Object Value = %@", object);
}

- (id)rootItemForBrowser:(NSBrowser *)browser
{
    return nil;
}

- (NSViewController *)browser:(NSBrowser *)browser
previewViewControllerForLeafItem:(id)item
{
    return nil;
}

- (NSViewController *)browser:(NSBrowser *)browser
  headerViewControllerForItem:(id)item
{
    return nil;
}

@end
