//
//  Pensioner.m
//  NotificationHomework
//
//  Created by Stepan Paholyk on 6/26/16.
//  Copyright © 2016 Stepan Paholyk. All rights reserved.
//

#import "Pensioner.h"
#import "Congress.h"

@implementation Pensioner

#pragma mark - Initialization

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.name = @"Scally";
        [[NSNotificationCenter defaultCenter] addObserver:self
                               selector:@selector(averagePriceChangedNotification:)
                                   name:CongressAveragePriceDidChangeNotification
                                 object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                               selector:@selector(pensionChangedNotification:)
                                   name:CongressPensionDidChangeNotification
                                 object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                               selector:@selector(appWillResignActive:)
                                   name:UIApplicationDidEnterBackgroundNotification
                                 object:nil];
        
    }
    return self;
}

#pragma mark - Notification

- (void) pensionChangedNotification:(NSNotification*) notification {
    NSNumber* value = [notification.userInfo objectForKey:CongressPensionUserInfoKey];
    float pension = [value floatValue];
    
    if (pension > self.pension) {
        NSLog(@"wow pension is bigger");
    } else {
        NSLog(@"fuck, pension is smaller");
    }
    
    _pension = pension;
}


- (void) averagePriceChangedNotification:(NSNotification*) notification {
    
    NSNumber* value = [notification.userInfo objectForKey:CongressAveragePriceUserInfoKey];
    float averagePrice = [value floatValue];
    
    if (averagePrice > self.averagePrice) {
        NSLog(@"Inflation!");
    } else {
        NSLog(@"Deflation!");
    }
    
    float inflationIndex = (averagePrice / _averagePrice - 1) * 100;
    
    NSLog(@"Inflation in this year equals %.2f%%", inflationIndex);
    
    _averagePrice = averagePrice;
}

#pragma mark - appWillResignActive

- (void) appWillResignActive:(NSNotification*) notification {
    NSLog(@"%@ goes sleep", self.name);
}

#pragma mark - Deallocation

- (void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
