//
//  SPAppDelegate.m
//  NotificationHomework
//
//  Created by Stepan Paholyk on 6/28/16.
//  Copyright © 2016 Stepan Paholyk. All rights reserved.
//

#import "SPAppDelegate.h"

@implementation SPAppDelegate

# pragma mark - Initialization

- (instancetype)init
{
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(applicationWillResignActive:)
                                                     name:UIApplicationWillResignActiveNotification
                                                   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(applicationDidEnterBackground:)
                                                     name:UIApplicationDidEnterBackgroundNotification
                                                   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(applicationWillEnterForeground:)
                                                     name:UIApplicationWillEnterForegroundNotification
                                                   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(applicationDidBecomeActive:)
                                                     name:UIApplicationDidBecomeActiveNotification
                                                   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(applicationWillTerminate:)
                                                     name:UIApplicationWillTerminateNotification
                                                   object:nil];
    }
    return self;
}

#pragma mark - Selectors for notifications

- (void) applicationWillResignActive:(NSNotification*) notification {
    NSLog(@"Custom AppDelegate says: applicationWillResignActive");
}

- (void) applicationDidEnterBackground:(NSNotification*) notification {
    NSLog(@"Custom AppDelegate says: applicationDidEnterBackground");
}

- (void) applicationWillEnterForeground:(NSNotification*) notification {
    NSLog(@"Custom AppDelegate says: applicationWillEnterForeground");
}

- (void) applicationDidBecomeActive:(NSNotification*) notification {
    NSLog(@"Custom AppDelegate says: applicationDidBecomeActive");
}

- (void) applicationWillTerminate:(NSNotification*) notification {
    NSLog(@"Custom AppDelegate says: applicationWillTerminate");
}

#pragma mark - Deallocation

- (void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
