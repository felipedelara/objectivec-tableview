//
//  FileManager.m
//  Challenge-TableView
//
//  Created by Felipe Ramon de Lara on 27/01/17.
//  Copyright © 2017 Felipe de Lara. All rights reserved.
//

#import "FileManager.h"

@implementation FileManager


+ (UIImage *) retrieveGravatarFromFileName:(NSString*) name{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *imagePath =[documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.png",name]];
    
    UIImage *retrievedImage = [UIImage imageWithContentsOfFile:imagePath];
    
    return retrievedImage;
}

+ (void) saveGravatarWithImage:(UIImage*)image withName:(NSString*)name {
    NSData *imageData = UIImagePNGRepresentation(image);
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    
    NSString *imagePath =[documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.png",name]];
    
    if (![imageData writeToFile:imagePath atomically:NO])
    {
        NSLog(@"Failed to cache image data to disk");
    }
    else
    {
        NSLog(@"Image successfully cashed in %@",imagePath);
    }
}

@end
