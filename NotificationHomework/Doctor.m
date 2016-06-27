//
//  Doctor.m
//  NotificationHomework
//
//  Created by Stepan Paholyk on 6/26/16.
//  Copyright © 2016 Stepan Paholyk. All rights reserved.
//

#import "Doctor.h"
#import "Congress.h"

@implementation Doctor

#pragma mark - Initialization

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        NSNotificationCenter* tmpCenter = [NSNotificationCenter defaultCenter];
        
        [tmpCenter addObserver:self
                      selector:@selector(averagePriceChangedNotification:)
                          name:CongressAveragePriceDidChangeNotification
                        object:nil];
        
        [tmpCenter addObserver:self
                      selector:@selector(salaryChangedNotification:)
                          name:CongressSalaryDidChangeNotification
                        object:nil];
    }

    return self;
}

#pragma mark - Notification

- (void) averagePriceChangedNotification:(NSNotification*) notification {
    
    NSNumber* value = [notification.userInfo objectForKey:CongressAveragePriceDidChangeNotification];
    float averagePrice = [value floatValue];
    
    if (averagePrice > self.averagePrice) {
        NSLog(@"Inflation!");
    } else {NSLog(@"Deflation!");}
}


- (void) salaryChangedNotification:(NSNotification*) notification {
    
    NSNumber* value = [notification.userInfo objectForKey:CongressSalaryDidChangeNotification];
    float salary = [value floatValue];
    
    if (salary > self.salary) {
        NSLog(@"Doctor is happy");
    } else {NSLog(@"Doctor isn't happy");}
}

#pragma mark - Deallocation

- (void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


@end
