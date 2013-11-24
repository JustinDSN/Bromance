//  User.h
//
//  Copyright (C) 2013 BromanceApp

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface User : NSObject
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *location;
@property (strong, nonatomic) NSString *objectId;
@property (strong, nonatomic) NSString *facebookId;
@property (nonatomic) double latitude;
@property (nonatomic) double longitude;
@property (nonatomic) NSInteger age;
@property (strong, nonatomic) NSString *bio;
@property (strong, nonatomic) NSMutableData *fbGraphData;
@property (strong, nonatomic) UIImage *profilePhoto;
@property (nonatomic) double distance;
@property (readonly) NSString *distanceFormat;
-(PFObject *) toPFObject;
#pragma mark Class Methods
+ (void)allUsersWithCompletion:(void (^)(NSArray *users, NSError *error))complete;
+ (User *)fromPFObject:(PFObject *)object;
@end
