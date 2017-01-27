//
//  User.h
//  Challenge-TableView
//
//  Created by Felipe Ramon de Lara on 26/01/17.
//  Copyright © 2017 Felipe de Lara. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BadgeSet.h"

@interface User : NSObject

    @property NSString *user_id;
    @property NSString *display_name;
    @property NSString *age;
    @property NSString *profile_image;
    @property BadgeSet *badges;

-(id)initWithId:(NSString *)id_ withDisplayName:(NSString *)displayName_ withAge:(NSString *)age_ withProfileImage:(NSString *) profileImage_ withBadgeSet:(BadgeSet*) badges_;

@end
