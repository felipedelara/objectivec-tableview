//
//  UsersSingleton.h
//  Challenge-TableView
//
//  Created by Felipe Ramon de Lara on 26/01/17.
//  Copyright © 2017 Felipe de Lara. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UsersSingleton : NSObject

@property NSMutableArray *userArray;

+ (instancetype)sharedInstance;
@end
