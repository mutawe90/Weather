//
//  DetailsViewController.m
//  Weather
//
//  Created by Yousef Mutawe on 8/2/18.
//  Copyright © 2018 Motawe. All rights reserved.
//

#import "DetailsViewController.h"
#import "NSDate+Helper.h"
@interface DetailsViewController ()

@end

@implementation DetailsViewController
- (IBAction)backAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    _dayLabel.text = [NSDate weekdayFromDate:_model.Date];
    _dateLabel.text = [NSDate stringFromDate:_model.Date withFormat:@"MMM dd, yyyy"];
    _morningImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@-s",_model.Day.Icon]];
    _nightImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@-s",_model.Night.Icon]];
    _morningLabel.text = _model.Day.IconPhrase;
    _nightLabel.text = _model.Night.IconPhrase;

    _morningTemp.text = [NSString stringWithFormat:@"%@°%@",_model.Temperature.Maximum.Value,_model.Temperature.Maximum.Unit];
    _nightTemp.text = [NSString stringWithFormat:@"%@°%@",_model.Temperature.Minimum.Value,_model.Temperature.Minimum.Unit];

//    _tempInWordsLabel.text = model.Day.IconPhrase;

//    @property (weak, nonatomic) IBOutlet UILabel *dayLabel;
//    @property (weak, nonatomic) IBOutlet UILabel *morningLabel;
//    @property (weak, nonatomic) IBOutlet UIImageView *morningImage;
//
//    @property (nonatomic) DailyForecastsModel *model;
//    @property (weak, nonatomic) IBOutlet UILabel *morningTemp;
//    @property (weak, nonatomic) IBOutlet UILabel *nightLabel;
//    @property (weak, nonatomic) IBOutlet UIImageView *nightImage;
//    @property (weak, nonatomic) IBOutlet UILabel *nightTemp;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
