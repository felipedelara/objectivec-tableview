//
//  Badge.m
//  Challenge-TableView
//
//  Created by Felipe Ramon de Lara on 27/01/17.
//  Copyright © 2017 Felipe de Lara. All rights reserved.
//

#import "BadgeSet.h"

@implementation BadgeSet

-(id)initWithGoldCount:(NSString *)goldCount_ withSilverCount:(NSString *)silverCount_ withBronzeCount:(NSString *) bronzeCount_{

    self = [super init];
    if (self) {
        self.goldCount = goldCount_;
        self.silverCount = silverCount_;
        self.bronzeCount = bronzeCount_;
    }
    return self;
}

@end
