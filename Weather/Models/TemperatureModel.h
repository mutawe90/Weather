//
//  TemperatureModel.h
//  Weather
//
//  Created by Yousef Mutawe on 8/2/18.
//  Copyright © 2018 Motawe. All rights reserved.
//

#import "JSONModel.h"
#import "ValueUnitModel.h"

@interface TemperatureModel : JSONModel
@property (nonatomic) ValueUnitModel <Optional> *Minimum;
@property (nonatomic) ValueUnitModel <Optional> *Maximum;

@end
