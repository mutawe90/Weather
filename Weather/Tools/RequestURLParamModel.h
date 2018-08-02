//
//  RequestURLParamModel.h
//  Baladytkom
//
//  Created by Yousef Mutawe on 1/13/18.
//  Copyright © 2018 Mutawe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constants.h"
@interface RequestURLParamModel : NSObject

@property (strong, nonatomic) NSString *urlMethod;
@property (strong, nonatomic) NSString *operationType;
@property (strong, nonatomic) NSMutableDictionary *parameters;

//		Instancetype
-(instancetype)GetDailyWeatherWithTempType:(BOOL)isFahrenheit;
-(instancetype)GetHourlyWeatherWithTempType:(BOOL)isFahrenheit;
@end
