//
//  Badge.h
//  Challenge-TableView
//
//  Created by Felipe Ramon de Lara on 27/01/17.
//  Copyright © 2017 Felipe de Lara. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BadgeSet : NSObject

@property NSString *goldCount;
@property NSString *silverCount;
@property NSString *bronzeCount;

-(id)initWithGoldCount:(NSString *)goldCount_ withSilverCount:(NSString *)silverCount_ withBronzeCount:(NSString *) bronzeCount_;

@end
