//
//  NetworkManager.h
//  TawseelCustomer
//
//  Created by Yousef Motawe on 10/23/17.
//  Copyright © 2018 Motawe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
#import "RequestURLParamModel.h"

@interface NetworkManager : AFHTTPSessionManager

+ (instancetype)sharedManager;
 
+ (void)requestGetOperationWithAPI:(RequestURLParamModel *)requestModel
                             block:(void (^)(id  _Nullable responseObject, NSError *error))block;

@end
