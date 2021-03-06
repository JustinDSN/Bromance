//  Message.m
//
//  Copyright (C) 2013 CoderBacon
//
//  Licensed under Creative Commons BY-NC-SA
//  http://creativecommons.org/licenses/by-nc-sa/3.0/deed.en_US

#import "CBAMessage.h"
#define MESSAGE @"Message"

#define TEXT @"text"
#define SENDER @"sender"
#define RECEIVER @"receiver"
#define CREATED_AT @"createdAt"

@implementation CBAMessage

- (id)initWithText:(NSString *)text andReceiver:(CBAUser *)receiver {
    self = [super init];
    
    if (self) {
        // Custom initialization
        self.text = text;
        //self.sender = [PFUser currentUser];
        self.receiver = receiver;
    }
    return self;
}

+ (void)allMessagesForLoggedInUserWithCompletion:(void (^)(NSMutableDictionary *messages, NSMutableDictionary *users, NSError *error))complete {
//    PFQuery *receiverQuery = [PFQuery queryWithClassName:MESSAGE];
//    [receiverQuery whereKey:RECEIVER equalTo:[PFUser currentUser]];
//    
//    PFQuery *senderQuery = [PFQuery queryWithClassName:MESSAGE];
//    [senderQuery whereKey:SENDER equalTo:[PFUser currentUser]];
//    
//    PFQuery *orQuery = [PFQuery orQueryWithSubqueries:@[receiverQuery, senderQuery]];
//    [orQuery orderByAscending:CREATED_AT];
//    
//    [orQuery findObjectsInBackgroundWithBlock:^(NSArray *messages, NSError *error) {
//        NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
//        NSMutableDictionary *userDict = [[NSMutableDictionary alloc] init];
//        
//        for (int i = 0; i < messages.count; i++) {
//            CBAMessage *msg = [CBAMessage fromPFObject:messages[i]];
//            PFUser *other = ([msg.sender.objectId isEqualToString:[PFUser currentUser].objectId]) ? msg.receiver : msg.sender;
//            
//            if (!dict[other.objectId]) {
//                dict[other.objectId] = [[NSMutableArray alloc] init];
//                userDict[other.objectId] = other;
//            }
//            
//            [dict[other.objectId] addObject:msg];
//        }
//        
//        PFQuery *userQuery = [PFUser query];
//        [userQuery whereKey:@"objectId" containedIn:[userDict allKeys]];
//        
//        [userQuery findObjectsInBackgroundWithBlock:^(NSArray *users, NSError *error) {
//            for (int i = 0; i < users.count; i++) {
//                PFUser *user = users[i];
//                [userDict setObject:user forKey:user.objectId];
//            }
//            
//            complete(dict, userDict, nil);
//        }];
//    }];
}

+ (void)allMessagesBetweenUser:(CBAUser *)user withCompletion:(void (^)(NSArray *messages, NSError *error))complete {
    
//    PFQuery *receiverQuery = [PFQuery queryWithClassName:MESSAGE];
//    [receiverQuery whereKey:RECEIVER equalTo:[PFUser currentUser]];
//    [receiverQuery whereKey:SENDER equalTo:user];
//    
//    PFQuery *senderQuery = [PFQuery queryWithClassName:MESSAGE];
//    [senderQuery whereKey:SENDER equalTo:[PFUser currentUser]];
//    [senderQuery whereKey:RECEIVER equalTo:user];
//    
//    PFQuery *orQuery = [PFQuery orQueryWithSubqueries:@[receiverQuery, senderQuery]];
//    [orQuery orderByAscending:CREATED_AT];
//    
//    [orQuery findObjectsInBackgroundWithBlock:^(NSArray *messages, NSError *error) {
//        NSMutableArray *msgs = [[NSMutableArray alloc] init];
//        
//        for (int i = 0; i < messages.count; i++) {
//            CBAMessage *msg = [CBAMessage fromPFObject:messages[i]];
//            [msgs addObject:msg];
//        }
//        
//        complete(msgs, error);
//    }];
}

@end
