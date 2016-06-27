//
//  AppDelegate.m
//  NotificationHomework
//
//  Created by Stepan Paholyk on 6/26/16.
//  Copyright © 2016 Stepan Paholyk. All rights reserved.
//

#import "AppDelegate.h"
#import "Businessman.h"
#include "Congress.h"

@interface AppDelegate ()
@property (strong, nonatomic) Congress* gover;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    self.gover = [[Congress alloc] init];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(congressNotification:)
                                                 name:CongressAveragePriceDidChangeNotification
                                               object:nil];
    
    Businessman* busyMan1 = [[Businessman alloc] init];
    Businessman* busyMan2 = [[Businessman alloc] init];
    Businessman* busyMan3 = [[Businessman alloc] init];
    Businessman* busyMan4 = [[Businessman alloc] init];
    Businessman* busyMan5 = [[Businessman alloc] init];

    busyMan1.averagePrice = busyMan2.averagePrice = busyMan3.averagePrice = busyMan4.averagePrice = busyMan5.averagePrice = self.gover.averagePrice;
    
    self.gover.averagePrice = 35;
    self.gover.averagePrice = 10;
    self.gover.averagePrice = 100;
    
    return YES;
}
- (void) congressNotification:(NSNotification*) notification {
    NSLog(@"congressNotification userInfo %@", notification.userInfo);
}

- (void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
