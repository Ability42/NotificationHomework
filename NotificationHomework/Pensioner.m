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
        NSNotificationCenter *tmpNC = [NSNotificationCenter defaultCenter];
        
        [tmpNC addObserver:self
                      selector:@selector(averagePriceChangedNotification:)
                          name:CongressAveragePriceDidChangeNotification
                        object:nil];
        
        [tmpNC addObserver:self
                  selector:@selector(pensionChangedNotification:)
                      name:CongressPensionDidChangeNotification
                    object:nil];
        
    }
    return self;
}

#pragma mark - Notification

- (void) pensionChangedNotification:(NSNotification*) notification {
    NSNumber* value = [notification.userInfo objectForKey:CongressPensionDidChangeNotification];
    float pension = [value floatValue];
    
    if (pension > self.pension) {
        NSLog(@"wow pension is bigger");
    } else {
        NSLog(@"fuck, pension is smaller");
    }
}


- (void) averagePriceChangedNotification:(NSNotification*) notification {
    
    NSNumber* value = [notification.userInfo objectForKey:CongressAveragePriceDidChangeNotification];
    float averagePrice = [value floatValue];
    
    if (averagePrice > self.averagePrice) {
        NSLog(@"Inflation!");
    } else {
        NSLog(@"Deflation!");
    }
}

#pragma mark - Deallocation

- (void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
