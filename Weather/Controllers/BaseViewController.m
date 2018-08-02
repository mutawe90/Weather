//
//  BaseViewController.m
//  Weather
//
//  Created by Yousef Mutawe on 8/2/18.
//  Copyright © 2018 Motawe. All rights reserved.
//

#import "BaseViewController.h"
#import "RSLoadingIndicator.h"

@interface BaseViewController ()<RSLoadingIndicatorDelegate>
{
    RSLoadingIndicator *indicator;
    NSTimer *ticker;
    NSTimer *stopTimer;
}
@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(unExpectedAction:)
                                                 name:kUnExpectedError object:nil];
    // Do any additional setup after loading the view.
}
- (void)unExpectedAction:(NSNotification *)note {

    [self stopLoader];
    
}
-(void)startLoader{
    indicator = [[RSLoadingIndicator alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    indicator.delegate = self;
    indicator.tag = 999;
    
    [self.view addSubview:indicator];


    ticker = [NSTimer scheduledTimerWithTimeInterval:1.0f / 3300.0f target:self selector:@selector(tick) userInfo:nil repeats:YES];
	
}
- (void)tick {
    [indicator didScroll:0.5f];
}

- (void)stopLoader {
    [indicator stopLoading];
    [indicator removeFromSuperview];
    indicator = nil;

    [ticker invalidate];
    ticker = nil;

    [stopTimer invalidate];
    stopTimer = nil;
    
    for (UIView *indicatorCheckView in [self.view subviews]) {
        if (indicatorCheckView.tag == 999) {
            [indicatorCheckView removeFromSuperview];
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - RSLoadingIndicatorDelegate



- (void)stopLoading {
    [ticker invalidate];
    ticker = nil;

    [stopTimer invalidate];
    stopTimer = nil;

 }

 

@end
