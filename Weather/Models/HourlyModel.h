//
//  HourlyModel.h
//  Weather
//
//  Created by Yousef Mutawe on 8/2/18.
//  Copyright © 2018 Motawe. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "ValueUnitModel.h"

@interface HourlyModel : JSONModel
@property (nonatomic) NSDate <Optional> *DateTime;
@property (nonatomic) NSString <Optional> *EpochDateTime;
@property (nonatomic) NSString <Optional> *IconPhrase;
@property (nonatomic) ValueUnitModel <Optional> *Temperature;
@property (nonatomic) NSString <Optional> *WeatherIcon;
@property (nonatomic) NSString <Optional> *MobileLink;
@property (nonatomic) NSString <Optional> *Link;

@end
