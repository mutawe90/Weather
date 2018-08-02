//
//  BaseViewController.h
//  Weather
//
//  Created by Yousef Mutawe on 8/2/18.
//  Copyright © 2018 Motawe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Utility.h"
#import "UserDefaults.h"
@interface BaseViewController : UIViewController
-(void)startLoader;
- (void)stopLoader;

@end
