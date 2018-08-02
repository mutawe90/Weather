//
//  NetworkManager.m
//  TawseelCustomer
//
//  Created by Yousef Motawe on 10/23/17.
//  Copyright © 2018 Motawe. All rights reserved.
//

#import "NetworkManager.h"
#import "AFURLSessionManager.h"
#import "Reachability.h"
#import "Utility.h"
@implementation NetworkManager

 
+ (instancetype)sharedManager {
    
    static NetworkManager *_sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedManager = [[NetworkManager alloc] initWithBaseURL:[NSURL URLWithString:END_POINT]];
        
        AFSecurityPolicy* policy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
        [policy setAllowInvalidCertificates:YES];
        [policy setValidatesDomainName:NO];

        [_sharedManager setSecurityPolicy:policy];
        
    });
    return _sharedManager;
}


- (id)init {
    if ((self = [super init])) {
    }
    return self;
}

+(BOOL)isReachable
{
    Reachability *networkReachability = [Reachability reachabilityForInternetConnection];
    NetworkStatus networkStatus = [networkReachability currentReachabilityStatus];
    if (networkStatus == NotReachable) {
        return NO;
    } else {
        return YES;
    }
}
+ (void)requestGetOperationWithAPI:(RequestURLParamModel *)requestModel
                             block:(void (^)(id  _Nullable responseObject, NSError *error))block{
    
    if (![self isReachable]) {
        [Utility customeErrorMessage:NSLocalizedString(@"No internet connection, if you used the app before, the app will show you last updated Weather!", nil)];
         return;
    }
    
    [NetworkManager sharedManager].requestSerializer = [AFHTTPRequestSerializer serializer];
    NSLog(@"API URL: %@",requestModel.urlMethod);

     [[NetworkManager sharedManager] GET:requestModel.urlMethod parameters:requestModel.parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {

        NSLog(@"Response: %@",responseObject);
        if (block) {

            block(responseObject,nil);

        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {

        NSString* ErrorResponse = [[NSString alloc] initWithData:(NSData *)error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey] encoding:NSUTF8StringEncoding];
        NSLog(@"ErrorResponse %@",ErrorResponse);
        [[NSNotificationCenter defaultCenter] postNotificationName:kUnExpectedError object:nil userInfo:nil];
             [Utility customeErrorMessage:ErrorResponse];


    }];
    
}

 
@end

