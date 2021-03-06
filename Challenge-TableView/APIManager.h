//
//  APIManager.h
//  Challenge-TableView
//
//  Created by Felipe Ramon de Lara on 24/01/17.
//  Copyright © 2017 Felipe de Lara. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APIManager : NSObject

+ (NSMutableArray *)createModelArrayFromJSON:(NSMutableDictionary *) itemsDictionary;
+ (void) RetrieveContentFromWeb:(void (^)(void))completionBlock;

@end
