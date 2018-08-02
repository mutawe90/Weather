//
//  HeadlineModel.h
//  Weather
//
//  Created by Yousef Mutawe on 8/2/18.
//  Copyright © 2018 Motawe. All rights reserved.
//

#import "JSONModel.h"

@interface HeadlineModel : JSONModel
@property (nonatomic) NSDate <Optional> *EffectiveDate;
@property (nonatomic) NSDate <Optional> *EndDate;
@property (nonatomic) NSString <Optional> *Category;
@property (nonatomic) NSString <Optional> *EffectiveEpochDate;
@property (nonatomic) NSString <Optional> *EndEpochDate;
@property (nonatomic) NSString <Optional> *Link;
@property (nonatomic) NSString <Optional> *MobileLink;
@property (nonatomic) NSString <Optional> *Severity;
@property (nonatomic) NSString <Optional> *Text;

@end
