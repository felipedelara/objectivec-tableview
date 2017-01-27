//
//  UsersSingleton.m
//  Challenge-TableView
//
//  Created by Felipe Ramon de Lara on 26/01/17.
//  Copyright © 2017 Felipe de Lara. All rights reserved.
//

#import "UsersSingleton.h"

@implementation UsersSingleton

@synthesize userArray;

+ (instancetype)sharedInstance
{
    static UsersSingleton *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[UsersSingleton alloc] init];
    });
    return sharedInstance;
}

@end
