//  MessageDetailViewController.h
//
//  Copyright (C) 2013 CoderBacon
//
//  Licensed under Creative Commons BY-NC-SA
//  http://creativecommons.org/licenses/by-nc-sa/3.0/deed.en_US

#import <UIKit/UIKit.h>
#import "CBAUser.h"

@interface CBAMessageDetailViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource, UITextFieldDelegate, UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) CBAUser *otherUser;
@property (strong, nonatomic) NSArray *messages;
@property (weak, nonatomic) IBOutlet UICollectionView *messageCollectionView;

@end
