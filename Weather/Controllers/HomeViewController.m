//
//  HomeViewController.m
//  Weather
//
//  Created by Yousef Mutawe on 8/2/18.
//  Copyright © 2018 Motawe. All rights reserved.
//

#import "HomeViewController.h"
#import "DailyWeatherModel.h"
#import "DailyWeatherCollectionViewCell.h"
#import "HourlyModel.h"
#import "HourlyWeatherTableViewCell.h"
#import "DetailsViewController.h"
@interface HomeViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
{
    DailyWeatherModel *dailyModel;
    NSArray *hourlyDataSource;
    BOOL hideLoading;
}

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if ([UserDefaults boolForKey:kUnit])  _unitSegmentedControl.selectedSegmentIndex = 1;
    [self customizeView];
    [self getWeatherForFiveDays];
    [self checkOldData];
}
-(void)checkOldData{
    if ([UserDefaults objectForKey:kCashedHourly]) {
        self->hourlyDataSource = [[NSArray alloc]initWithArray:[UserDefaults objectForKey:kCashedHourly]];
        [self->_tableView reloadData];
    }
    if ([UserDefaults objectForKey:kCashedWeather]) {
        self->dailyModel = [[DailyWeatherModel alloc]initWithDictionary:[UserDefaults objectForKey:kCashedWeather] error:nil];
        [self->_collectionView reloadData];
        [self getHourlyTemp];
    }
}
-(void)customizeView{
    _viewHeightConstraint.constant = self.view.frame.size.height;
    [self.collectionView registerNib:[UINib nibWithNibName:@"DailyWeatherCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"DailyWeatherCollectionViewCell"];

    UINib *cellNib = [UINib nibWithNibName:@"HourlyWeatherTableViewCell" bundle:nil];
    [self.tableView registerNib:cellNib forCellReuseIdentifier:@"HourlyWeatherTableViewCell"];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 50;
    self.tableView.tableFooterView = [UIView new];
    _scrollView.scrollEnabled = NO;
}
-(void)getWeatherForFiveDays{
    if (!hideLoading)  [self startLoader];

    RequestURLParamModel *model = [[RequestURLParamModel alloc]GetDailyWeatherWithTempType:[UserDefaults boolForKey:kUnit]];
    [NetworkManager requestGetOperationWithAPI:model block:^(id  _Nullable responseObject, NSError *error) {
        if (error) {
            [Utility customeErrorMessage:error.localizedDescription];
            return ;
        }
        [UserDefaults setObject:responseObject forKey:kCashedWeather];
        self->dailyModel = [[DailyWeatherModel alloc]initWithDictionary:responseObject error:nil];
         [self->_collectionView reloadData];
        [self getHourlyTemp];
    }];
}
-(void)getHourlyTemp{
 
    RequestURLParamModel *model = [[RequestURLParamModel alloc]GetHourlyWeatherWithTempType:[UserDefaults boolForKey:kUnit]];
    [NetworkManager requestGetOperationWithAPI:model block:^(id  _Nullable responseObject, NSError *error) {
        if (error) {
            [Utility customeErrorMessage:error.localizedDescription];
            return ;
        }
        self->hourlyDataSource = [[NSArray alloc]initWithArray:responseObject];
        [UserDefaults setObject:responseObject forKey:kCashedHourly];
        [Utility scheduleNotifications:self->hourlyDataSource];
        [self performSelector:@selector(stopLoader) withObject:nil afterDelay:0.5];
        [self->_tableView reloadData];
        [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(repeatWeatherCall) object:nil];
        [self performSelector:@selector(repeatWeatherCall) withObject:nil afterDelay:5 * 60];
     }];
}
-(void)repeatWeatherCall{
    hideLoading = YES;
    [self getWeatherForFiveDays];

}
#pragma mark - UICollectionView DataSource && Delegate

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return dailyModel.DailyForecasts.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    DailyWeatherCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"DailyWeatherCollectionViewCell" forIndexPath:indexPath];
    DailyForecastsModel *model = [[DailyForecastsModel alloc]initWithDictionary:dailyModel.DailyForecasts[indexPath.row] error:nil];
    [cell bindData:model];
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    DetailsViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailsViewController"];

    viewController.model = [[DailyForecastsModel alloc]initWithDictionary:dailyModel.DailyForecasts[indexPath.row] error:nil];
    [self.navigationController pushViewController:viewController animated:YES];
}
 
- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    UIDeviceOrientation orientation = [[UIDevice currentDevice] orientation];
    if (orientation == UIDeviceOrientationPortrait) {
        [self.scrollView setContentOffset:
         CGPointMake(0, -self.scrollView.contentInset.top) animated:NO];
        _scrollView.scrollEnabled = NO;
    }else{
        _scrollView.scrollEnabled = YES;
    }

}

- (IBAction)changeUnitAction:(UISegmentedControl *)sender {
    hideLoading = NO;
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(repeatWeatherCall) object:nil];
    [UserDefaults setBool:sender.selectedSegmentIndex forKey:kUnit];
    [self getWeatherForFiveDays];

}

#pragma mark - UITableView DataSource && Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return hourlyDataSource.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HourlyWeatherTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HourlyWeatherTableViewCell"];
    HourlyModel *model = [[HourlyModel alloc]initWithDictionary:hourlyDataSource[indexPath.row] error:nil];
    [cell bindData:model];
    return cell;
}

@end
