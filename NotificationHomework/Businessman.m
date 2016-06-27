//
//  Businessman.m
//  NotificationHomework
//
//  Created by Stepan Paholyk on 6/26/16.
//  Copyright © 2016 Stepan Paholyk. All rights reserved.
//

#import "Businessman.h"
#import "Congress.h"

@implementation Businessman

#pragma mark - Initialization

- (instancetype)init {
    self = [super init];
    if (self) {
        
        NSNotificationCenter* tmpCenter = [NSNotificationCenter defaultCenter];
        
        [tmpCenter addObserver:self
                  selector:@selector(taxLevelChangedNotification:)
                      name:CongressSalaryDidChangeNotification
                    object:nil];
        
        [tmpCenter addObserver:self selector:@selector(averagePriceChangedNotification:) name:CongressAveragePriceDidChangeNotification
                     object:nil];
        
        
    }
    return self;
}

# pragma mark - Notification

- (void) taxLevelChangedNotification:(NSNotification*) notification {
    NSNumber* value = [notification.userInfo objectForKey:CongressTaxLevelDidChangeNotification];
    float taxLevel = [value floatValue];
    
    if (taxLevel > self.taxLevel) {
        NSLog(@"Tax Level increase");
    } else {
        NSLog(@"Tax Level decrease");
    }
}

- (void) averagePriceChangedNotification:(NSNotification*) notification {

    NSNumber* value = [notification.userInfo objectForKey:CongressAveragePriceDidChangeNotification];
    float averagePrice = [value floatValue];
    
    if (averagePrice > self.averagePrice) {
        NSLog(@"Inflation!");
    } else {NSLog(@"Deflation!");}
    
    float inflationIndex = averagePrice / self.averagePrice;
    
    NSLog(@"Inflation in this year equals %f percent", inflationIndex * 100.0);
    self.averagePrice = averagePrice;
}

#pragma mark - Deallocation

- (void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


@end
