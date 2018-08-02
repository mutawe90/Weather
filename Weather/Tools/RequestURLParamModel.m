//
//  RequestURLParamModel.m
//  Baladytkom
//
//  Created by Yousef Mutawe on 1/13/18.
//  Copyright © 2018 Mutawe. All rights reserved.
//

#import "RequestURLParamModel.h"
#import "Constants.h"
 @implementation RequestURLParamModel

-(instancetype)GetDailyWeatherWithTempType:(BOOL)isFahrenheit
{
    NSString *metric =isFahrenheit ? @"false" :@"true" ;
    _urlMethod = [NSString stringWithFormat:@"/forecasts/v1/daily/5day/%@?apikey=%@&details=false&metric=%@",kDubai_Key,API_Key,metric];
    _operationType = kOperationTypeGET;
    _parameters = [NSMutableDictionary dictionary];
    return self;
    
 }
-(instancetype)GetHourlyWeatherWithTempType:(BOOL)isFahrenheit{
    NSString *metric =isFahrenheit ? @"false" :@"true" ;
    _urlMethod = [NSString stringWithFormat:@"/forecasts/v1/hourly/12hour/%@?apikey=%@&details=false&metric=%@",kDubai_Key,API_Key,metric];
    _operationType = kOperationTypeGET;
    _parameters = [NSMutableDictionary dictionary];
    return self;
}
@end
