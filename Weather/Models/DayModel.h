//
//  DayModel.h
//  Weather
//
//  Created by Yousef Mutawe on 8/2/18.
//  Copyright © 2018 Motawe. All rights reserved.
//

#import "JSONModel.h"

@interface DayModel : JSONModel
@property (nonatomic) NSString <Optional> *Icon;
@property (nonatomic) NSString <Optional> *IconPhrase;

@end
