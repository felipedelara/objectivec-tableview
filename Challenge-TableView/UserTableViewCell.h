//
//  UserTableViewCell.h
//  Challenge-TableView
//
//  Created by Felipe Ramon de Lara on 26/01/17.
//  Copyright © 2017 Felipe de Lara. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *displayNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *ageLabel;
@property (weak, nonatomic) IBOutlet UIImageView *profilePictureImageView;

@end
