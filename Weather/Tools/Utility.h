//
//  Utility.h
//  Weather
//
//  Created by Yousef Mutawe on 8/2/18.
//  Copyright © 2018 Motawe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constants.h"
#import "NetworkManager.h"
#import "RequestURLParamModel.h"

@interface Utility : NSObject
+ (void)customeErrorMessage:(NSString *)message;
+ (void)customeSuccessMessage:(NSString *)message;
+ (void) scheduleNotifications:(NSArray *)dataSource;
@end
