//
//  DailyWeatherModel.h
//  Weather
//
//  Created by Yousef Mutawe on 8/2/18.
//  Copyright © 2018 Motawe. All rights reserved.
//

#import "JSONModel.h"
#import "DailyForecastsModel.h"
#import "HeadlineModel.h"

@interface DailyWeatherModel : JSONModel
@property (nonatomic) NSArray <Optional> *DailyForecasts;
@property (nonatomic) HeadlineModel <Optional> *Headline;

@end
