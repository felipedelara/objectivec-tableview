//
//  APIManager.m
//  Challenge-TableView
//
//  Created by Felipe Ramon de Lara on 24/01/17.
//  Copyright © 2017 Felipe de Lara. All rights reserved.
//

#import "APIManager.h"
#import <Foundation/Foundation.h>

@implementation APIManager

+ (void) RetrieveContentFromWeb{
    
    NSDictionary *headers = @{ @"cache-control": @"no-cache",
                               @"postman-token": @"cd1a96f4-dc3d-adda-0bed-a3cadf0120b6" };
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"https://api.stackexchange.com/2.2/users?site=stackoverflow"]
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:10.0];
    [request setHTTPMethod:@"GET"];
    [request setAllHTTPHeaderFields:headers];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request
                                                completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                    if (error) {
                                                        NSLog(@"%@", error);
                                                    } else {
                                                        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
                                                        NSLog(@"%@", httpResponse);
                                                    }
                                                }];
    [dataTask resume];
}


@end
