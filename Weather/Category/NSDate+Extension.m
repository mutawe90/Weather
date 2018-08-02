//
//  NSDate+Extension.m
//  Weather
//
//  Created by Yousef Mutawe on 7/31/18.
//  Copyright © 2018 Motawe. All rights reserved.
//

#import "NSDate+Extension.h"

@implementation NSDate (Extension)

+ (NSString *)weekdayFromDate:(NSDate *)date {
    
    NSArray *weekdays = @[[NSNull null], @"Sunday", @"Monday", @"Tuseday", @"Wednesday", @"Thursday",@"Friday", @"Saturday"];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    [calendar setTimeZone:[[NSTimeZone alloc] initWithName:@"Asia/Muscat"]];
    NSDateComponents *dateComponents = [calendar components:NSCalendarUnitWeekday fromDate:date];
    return [weekdays objectAtIndex:dateComponents.weekday];
}

@end
