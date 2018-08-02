//
//  Utility.m
//  Weather
//
//  Created by Yousef Mutawe on 8/2/18.
//  Copyright © 2018 Motawe. All rights reserved.
//

#import "Utility.h"
#import <UIKit/UIKit.h>
#import <UserNotifications/UserNotifications.h>
#import "HourlyModel.h"
@implementation Utility
static Utility *sharedManager = nil;
 + (Utility*)sharedManager {
    static dispatch_once_t once;
    dispatch_once(&once, ^
                  {
                      sharedManager = [[Utility alloc] init];
                  });

    return sharedManager;
}
+ (void)customeErrorMessage:(NSString *)message {

    [Utility alertViewWithNoActionsWithTitle:@"Error" body:message buttonTitle:@"Close"];
}

+ (void)customeSuccessMessage:(NSString *)message{

    [Utility alertViewWithNoActionsWithTitle:@"Success" body:message buttonTitle:@"Close"];

}
+ (void)alertViewWithNoActionsWithTitle:(NSString *)title body:(NSString *)body buttonTitle:(NSString *)buttonTitle{


    UIAlertController* alert = [UIAlertController alertControllerWithTitle:title
                                                                   message:body
                                                            preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:buttonTitle style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];

    [alert addAction:defaultAction];


    [[Utility getCurrentNavigationController] presentViewController:alert animated:YES completion:nil];

}
+ (UIViewController *)getCurrentNavigationController{
    UIViewController *parentViewController = [[[UIApplication sharedApplication] delegate] window].rootViewController;

    while (parentViewController.presentedViewController != nil){
        parentViewController = parentViewController.presentedViewController;
    }

    return parentViewController;
    
}
+ (void) scheduleNotifications:(NSArray *)dataSource{
    [[UNUserNotificationCenter currentNotificationCenter] removeAllPendingNotificationRequests];

    for (int x = 0; x<dataSource.count;x++) {

        HourlyModel *model = [[HourlyModel alloc]initWithDictionary:dataSource[x] error:nil];

        NSDate *scheduleDate = model.DateTime;

         NSLog(@"NSDate:%@",scheduleDate);

        NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];

        [calendar setTimeZone:[NSTimeZone localTimeZone]];

        NSDateComponents *components = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond|NSCalendarUnitTimeZone fromDate:scheduleDate];

        NSString *timeAndWeatherString = [NSString stringWithFormat:@"The current temperature is: %@°%@",model.Temperature.Value,model.Temperature.Unit];

        UNMutableNotificationContent* content = [[UNMutableNotificationContent alloc] init];
        content.title = [NSString localizedUserNotificationStringForKey:@"Weather Now!" arguments:nil];
        content.body = [NSString localizedUserNotificationStringForKey:timeAndWeatherString
                                                             arguments:nil];
        content.sound = [UNNotificationSound defaultSound];

        UNCalendarNotificationTrigger *trigger = [UNCalendarNotificationTrigger triggerWithDateMatchingComponents:components
                                                                                                          repeats:NO];

        UNNotificationRequest* request = [UNNotificationRequest requestWithIdentifier:timeAndWeatherString
                                                                              content:content trigger:trigger];

        // Schedule the notification.
        UNUserNotificationCenter* center = [UNUserNotificationCenter currentNotificationCenter];
        [center addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
            if (!error) {
                NSLog(@"add NotificationRequest succeeded!");
            }
        }];
    }

}
@end
