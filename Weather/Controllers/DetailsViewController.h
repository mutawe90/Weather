//
//  DetailsViewController.h
//  Weather
//
//  Created by Yousef Mutawe on 8/2/18.
//  Copyright © 2018 Motawe. All rights reserved.
//

#import "BaseViewController.h"
#import "DailyForecastsModel.h"
#import "NSDate+Extension.h"

@interface DetailsViewController : BaseViewController
@property (weak, nonatomic) IBOutlet UILabel *dayLabel;
@property (weak, nonatomic) IBOutlet UILabel *morningLabel;
@property (weak, nonatomic) IBOutlet UIImageView *morningImage;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *scrollHeight;

@property (nonatomic) DailyForecastsModel *model;
@property (weak, nonatomic) IBOutlet UILabel *morningTemp;
@property (weak, nonatomic) IBOutlet UILabel *nightLabel;
@property (weak, nonatomic) IBOutlet UIImageView *nightImage;
@property (weak, nonatomic) IBOutlet UILabel *nightTemp;

@end
