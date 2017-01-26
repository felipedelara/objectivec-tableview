//
//  User.m
//  Challenge-TableView
//
//  Created by Felipe Ramon de Lara on 26/01/17.
//  Copyright © 2017 Felipe de Lara. All rights reserved.
//

#import "User.h"

@implementation User

-(id)initWithId:(NSString *)id_ withDisplayName:(NSString *)displayName_ withAge:(NSString *)age_ withProfileImage:(NSString *) profileImage_ {

    self = [super init];
    if (self) {
        self.user_id = id_;
        self.display_name = displayName_;
        self.age = age_;
        self.profile_image = profileImage_;
    }
    return self;
}

@end
