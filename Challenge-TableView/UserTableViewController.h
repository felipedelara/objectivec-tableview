//
//  EmployeeTableViewController.h
//  Challenge-TableView
//
//  Created by Felipe Ramon de Lara on 25/01/17.
//  Copyright © 2017 Felipe de Lara. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserTableViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property NSMutableArray *userArray;

- (void) reload;
- (NSManagedObjectContext *)managedObjectContext;

@end
