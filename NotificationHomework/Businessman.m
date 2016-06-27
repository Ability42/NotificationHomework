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
        
        NSNotificationCenter* tmpBusinessmanCenter = [NSNotificationCenter defaultCenter];
        
        [tmpBusinessmanCenter addObserver:self
                                 selector:@selector(taxLevelChangedNotification:)
                                    name:CongressTaxLevelDidChangeNotification
                                   object:nil];
        
        [tmpBusinessmanCenter addObserver:self
                                 selector:@selector(averagePriceChangedNotification:)
                                     name:CongressAveragePriceDidChangeNotification
                                   object:nil];
        
        
    }
    return self;
}

# pragma mark - Notification

- (void) taxLevelChangedNotification:(NSNotification*) notification {
    NSNumber* value = [notification.userInfo objectForKey:CongressTaxLevelUserInfoKey];
    float taxLevel = [value floatValue];
    
    if (taxLevel > self.taxLevel) {
        NSLog(@"Tax Level increase");
    } else {
        NSLog(@"Tax Level decrease");
    }
}

- (void) averagePriceChangedNotification:(NSNotification*) notification {

    NSNumber* value = [notification.userInfo objectForKey:CongressAveragePriceUserInfoKey];
    float averagePrice = [value floatValue];
    
    if (averagePrice > self.averagePrice) {
        NSLog(@"Inflation!");
    } else {NSLog(@"Deflation!");}
    // inflation calculated: (new price / old price - 1) * 100%
    float inflationIndex = (averagePrice / _averagePrice - 1) * 100;
    
    NSLog(@"Inflation in this year equals %.2f%%", inflationIndex);
    
    if ((averagePrice * _taxLevel) > 5) {
        NSLog(@"Businessman in bad mood now");
    } else {NSLog(@"Businessman in good mood now");}
    _averagePrice = averagePrice;
}

#pragma mark - Deallocation

- (void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


@end
