//  UserProfileViewController.h
//
//  Copyright (C) 2013 CoderBacon
//
//  Licensed under Creative Commons BY-NC-SA
//  http://creativecommons.org/licenses/by-nc-sa/3.0/deed.en_US

#import <UIKit/UIKit.h>
#import "User.h"

@interface UserProfileViewController : UIViewController

- (IBAction)blockUser:(id)sender;

@property (strong, nonatomic) User *user;
@property (strong, nonatomic) IBOutlet UILabel *ageLabel;
@property (strong, nonatomic) IBOutlet UILabel *locationLabel;
@property (strong, nonatomic) IBOutlet UIImageView *profileImageView;
@property (strong, nonatomic) IBOutlet UILabel *bioLabel;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@end
