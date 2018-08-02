//
//  DailyWeatherCollectionViewCell.h
//  Weather
//
//  Created by Yousef Mutawe on 8/2/18.
//  Copyright © 2018 Motawe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DailyForecastsModel.h"
@interface DailyWeatherCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIView *innerView;
@property (weak, nonatomic) IBOutlet UILabel *dayLabel;
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *tempLabel;
@property (weak, nonatomic) IBOutlet UILabel *maxLabel;
@property (weak, nonatomic) IBOutlet UILabel *minLabel;
-(void)bindData:(DailyForecastsModel *)model;
@property (weak, nonatomic) IBOutlet UILabel *tempInWordsLabel;
@end
