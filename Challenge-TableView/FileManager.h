//
//  FileManager.h
//  Challenge-TableView
//
//  Created by Felipe Ramon de Lara on 27/01/17.
//  Copyright © 2017 Felipe de Lara. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface FileManager : NSObject


+ (UIImage *) retrieveGravatarFromFileName:(NSString*) name;
+ (void) saveGravatarWithImage:(UIImage*)image withName:(NSString*)name;


@end
