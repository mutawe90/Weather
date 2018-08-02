//
//  HourlyWeatherTableViewCell.m
//  Weather
//
//  Created by Yousef Mutawe on 8/2/18.
//  Copyright © 2018 Motawe. All rights reserved.
//

#import "HourlyWeatherTableViewCell.h"
#import "DayModel.h"
#import "NSDate+Helper.h"

@implementation HourlyWeatherTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)bindData:(HourlyModel *)model{
    _timeLabel.text = [NSDate stringFromDate:model.DateTime withFormat:@"hh:mm aa"];
    _highLabel.text = [NSString stringWithFormat:@"%@°%@",model.Temperature.Value,model.Temperature.Unit];
    _lowLabel.text = [NSString stringWithFormat:@"%@°%@",model.Temperature.Value,model.Temperature.Unit];
    _iconImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@-s",model.WeatherIcon]];

}

@end
