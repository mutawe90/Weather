//
//  UserDefaults.m
//  Weather
//
//  Created by Yousef Mutawe on 8/1/18.
//  Copyright © 2018 Motawe. All rights reserved.
//

#import "UserDefaults.h"

@implementation UserDefaults
+ (void)setObject:(id)obj forKey:(NSString *)key {

    [[NSUserDefaults standardUserDefaults] setObject:obj forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (id)objectForKey:(NSString *)key {

    return [[NSUserDefaults standardUserDefaults] objectForKey:key];
}

+ (void)setBool:(BOOL)anBool forKey:(NSString *)key {

    [[NSUserDefaults standardUserDefaults] setBool:anBool forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (BOOL)boolForKey:(NSString *)key {

    return [[NSUserDefaults standardUserDefaults] boolForKey:key];
}

@end
