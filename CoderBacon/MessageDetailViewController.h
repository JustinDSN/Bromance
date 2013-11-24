//  MessageDetailViewController.h
//
//  Copyright (C) 2013 BromanceApp
//
//  Licensed under Creative Commons BY-NC-SA
//  http://creativecommons.org/licenses/by-nc-sa/3.0/deed.en_US

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface MessageDetailViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource, UITextFieldDelegate, UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) PFUser *otherUser;
@property (strong, nonatomic) NSArray *messages;
@property (weak, nonatomic) IBOutlet UICollectionView *messageCollectionView;

@end