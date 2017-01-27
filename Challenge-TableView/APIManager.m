//
//  APIManager.m
//  Challenge-TableView
//
//  Created by Felipe Ramon de Lara on 24/01/17.
//  Copyright © 2017 Felipe de Lara. All rights reserved.
//

#import "APIManager.h"
#import <Foundation/Foundation.h>
#import "User.h"
#import "BadgeSet.h"
#import "UsersSingleton.h"

@implementation APIManager

+ (NSMutableArray *) createModelArrayFromJSON:(NSMutableDictionary *) itemsDictionary{
    
    
    NSEnumerator * enumerator = [itemsDictionary objectEnumerator];
    
    NSDictionary * item = [enumerator nextObject];
    
    NSMutableArray * userArray = [[NSMutableArray alloc] init];
    
    NSString *user_id;
    NSString *display_name;
    NSString *age;
    NSString *profile_image;
    User *newUser;
    
    NSString *goldCount;
    NSString *silverCount;
    NSString *bronzeCount;
    BadgeSet *badges;

    
    
    for (NSMutableDictionary* userItem in itemsDictionary) {
        user_id = [NSString stringWithFormat:@"%@", [userItem objectForKey:@"user_id"]];
        display_name = [NSString stringWithFormat:@"%@", [userItem objectForKey:@"display_name"]];
        age = [NSString stringWithFormat:@"%@", [userItem objectForKey:@"age"]];
        profile_image = [NSString stringWithFormat:@"%@", [userItem objectForKey:@"profile_image"]];
        
        bronzeCount = [NSString stringWithFormat:@"%@", [userItem valueForKeyPath:@"badge_counts.bronze"]];
        silverCount = [NSString stringWithFormat:@"%@", [userItem valueForKeyPath:@"badge_counts.silver"]];
        goldCount = [NSString stringWithFormat:@"%@", [userItem valueForKeyPath:@"badge_counts.gold"]];

        badges = [[BadgeSet alloc] initWithGoldCount:goldCount withSilverCount:silverCount withBronzeCount:bronzeCount];


        newUser = [[User alloc] initWithId:user_id withDisplayName:display_name withAge:age withProfileImage:profile_image withBadgeSet:badges];
        
        [userArray addObject:newUser];
    }
    
    return userArray;
}

+ (void) RetrieveContentFromWeb:(void (^)(void))completionBlock{
    
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
            NSDictionary *resultDictionary = [NSJSONSerialization JSONObjectWithData:data
                                                                     options:0
                                                                     error:NULL];
            
            
            NSEnumerator *resultEnumerator = [resultDictionary keyEnumerator];
            id key;

            NSMutableDictionary* arrayForKey =[resultDictionary objectForKey:@"items"];
            
            NSMutableArray *users = [self createModelArrayFromJSON:arrayForKey];
            NSLog(@"Finished reading dictionary! User array count: %lu", (unsigned long)users.count);

            [UsersSingleton sharedInstance].userArray = users;
            completionBlock();
        }
                }];
    [dataTask resume];
}




@end
