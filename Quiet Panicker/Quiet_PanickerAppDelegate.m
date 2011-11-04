//
//  Quiet_PanickerAppDelegate.m
//  Quiet Panicker
//
//  Created by melnikov on 11/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Quiet_PanickerAppDelegate.h"
#import "AddEditServerView.h"
#import "DashBoardView.h"


@implementation Quiet_PanickerAppDelegate


@synthesize window=_window;
@synthesize servers;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    self.servers = [[NSMutableArray alloc] initWithCapacity:0];
    // Override point for customization after application launch.
    
    if ([self.servers count] == 0)
    {
        AddEditServerView * view = [[UINavigationController alloc] initWithRootViewController: [[AddEditServerView alloc]initWithIndex:-1]];
        [self.window setRootViewController:view];
        [view release];
    }
    else
    {
       
            DashBoardView * view = [[UINavigationController alloc] initWithRootViewController: [[DashBoardView alloc]init]];
            [self.window setRootViewController:view];
            [view release];
    }
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

@end
