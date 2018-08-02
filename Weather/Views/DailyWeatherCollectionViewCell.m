//
//  DailyWeatherCollectionViewCell.m
//  Weather
//
//  Created by Yousef Mutawe on 8/2/18.
//  Copyright © 2018 Motawe. All rights reserved.
//

#import "DailyWeatherCollectionViewCell.h"
#import "NSDate+Extension.h"
@implementation DailyWeatherCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundColor = [UIColor clearColor];
    self.contentView.backgroundColor = [UIColor clearColor];
    _innerView.layer.cornerRadius = 5;
    // Initialization code
}
-(void)bindData:(DailyForecastsModel *)model{
     _dayLabel.text = [NSDate weekdayFromDate:model.Date];
    _iconImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@-s",model.Day.Icon]];
    _tempLabel.text = [NSString stringWithFormat:@"%@°%@",model.Temperature.Maximum.Value,model.Temperature.Maximum.Unit];
    _maxLabel.text = [NSString stringWithFormat:@"%@°%@",model.Temperature.Maximum.Value,model.Temperature.Maximum.Unit];
    _minLabel.text = [NSString stringWithFormat:@"%@°%@",model.Temperature.Minimum.Value,model.Temperature.Minimum.Unit];
    _tempInWordsLabel.text = model.Day.IconPhrase;
}
@end
