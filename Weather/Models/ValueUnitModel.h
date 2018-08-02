//
//  ValueUnitModel.h
//  Weather
//
//  Created by Yousef Mutawe on 8/2/18.
//  Copyright © 2018 Motawe. All rights reserved.
//

#import "JSONModel.h"

@interface ValueUnitModel : JSONModel
@property (nonatomic) NSString <Optional> *Value;
@property (nonatomic) NSString <Optional> *Unit;
@property (nonatomic) NSString <Optional> *UnitType;

@end
