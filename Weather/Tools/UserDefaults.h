//
//  UserDefaults.h
//  Weather
//
//  Created by Yousef Mutawe on 8/1/18.
//  Copyright © 2018 Motawe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserDefaults : NSObject
+ (void)setObject:(id)obj forKey:(NSString *)key;
+ (id)objectForKey:(NSString *)key;

+ (void)setBool:(BOOL)anBool forKey:(NSString *)key;
+ (BOOL)boolForKey:(NSString *)key;

@end
