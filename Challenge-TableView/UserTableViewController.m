//
//  EmployeeTableViewController.m
//  Challenge-TableView
//
//  Created by Felipe Ramon de Lara on 25/01/17.
//  Copyright © 2017 Felipe de Lara. All rights reserved.
//

#import "UserTableViewController.h"
#import "APIManager.h"
#import "UsersSingleton.h"
#import "UserTableViewCell.h"
#import "User.h"
#import "FileManager.h"


@interface UserTableViewController ()

@end

@implementation UserTableViewController

@synthesize tableView = _tableView;

- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}

//Reload TableView
- (void) reload{
    dispatch_async(dispatch_get_main_queue(), ^{
        [_tableView reloadData];
    });
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [APIManager RetrieveContentFromWeb:^{
        [self reload];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [UsersSingleton sharedInstance].userArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UserTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"UserCell" forIndexPath:indexPath];
    
    User *user = [[UsersSingleton sharedInstance].userArray objectAtIndex:indexPath.row];
    cell.displayNameLabel.text = user.display_name;
    
    cell.goldCountLabel.text = [NSString stringWithFormat: @"🥇 %@",user.badges.goldCount];
    cell.silverCountLabel.text = [NSString stringWithFormat: @"🥈 %@",user.badges.silverCount];
    cell.bronzeCountLabel.text = [NSString stringWithFormat: @"🥉 %@",user.badges.bronzeCount];
    
    
    UIImage * retrievedImageFromFile = [FileManager retrieveGravatarFromFileName:[user getPathWithoutSpecialCharacters]];

    if(retrievedImageFromFile!=nil){
        cell.profilePictureImageView.image = retrievedImageFromFile;
        [cell.imageLoadingIndicator stopAnimating];
        cell.imageLoadingIndicator.hidden = true;
        NSLog(@"No web retrieve needed from %@. Image loaded from cached file 😄", user.display_name);
    }else{
        NSLog(@"No cached image for %@. Must load from web! 😉", user.display_name);

        cell.profilePictureImageView.image = nil;
        cell.imageLoadingIndicator.hidden = false;
        [cell.imageLoadingIndicator startAnimating];
        
        NSURL *url = [NSURL URLWithString:user.profile_image];
        
        NSURLSessionTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            if (data) {
                UIImage *image = [UIImage imageWithData:data];
                if (image) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        cell.profilePictureImageView.image = image;
                        [cell.imageLoadingIndicator stopAnimating];
                        cell.imageLoadingIndicator.hidden = true;
                        
                        [FileManager saveGravatarWithImage:image withName:[user getPathWithoutSpecialCharacters]];
                        
                    });
                }
            }
        }];
        [task resume];
    }
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
