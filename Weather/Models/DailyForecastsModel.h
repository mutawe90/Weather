//
//  DailyForecastsModel.h
//  Weather
//
//  Created by Yousef Mutawe on 8/2/18.
//  Copyright © 2018 Motawe. All rights reserved.
//

#import "JSONModel.h"
#import "TemperatureModel.h"
#import "DayModel.h"

@interface DailyForecastsModel : JSONModel
@property (nonatomic) NSDate <Optional> *Date;
@property (nonatomic) NSString <Optional> *EpochDate;
@property (nonatomic) TemperatureModel <Optional> *Temperature;
@property (nonatomic) DayModel <Optional> *Day;
@property (nonatomic) DayModel <Optional> *Night;
@property (nonatomic) NSArray <Optional> *Sources;
@property (nonatomic) NSString <Optional> *MobileLink;
@property (nonatomic) NSString <Optional> *Link;

@end
