//  Message.m
//
//  Copyright (C) 2013 BromanceApp
//
//  Licensed under Creative Commons BY-NC-SA
//  http://creativecommons.org/licenses/by-nc-sa/3.0/deed.en_US

#import "Message.h"
#define MESSAGE @"Message"

#define TEXT @"text"
#define SENDER @"sender"
#define RECEIVER @"receiver"
#define CREATED_AT @"createdAt"

@implementation Message

- (id)initWithText:(NSString *)text andReceiver:(PFUser *)receiver {
    self = [super init];
    
    if (self) {
        // Custom initialization
        self.text = text;
        self.sender = [PFUser currentUser];
        self.receiver = receiver;
    }
    return self;
}

- (PFObject *) toPFObject {
    PFObject *object = [[PFObject alloc] initWithClassName:MESSAGE];
    object[TEXT] = self.text;
    object[SENDER] = self.sender;
    object[RECEIVER] = self.receiver;
    
    PFACL *acl = [PFACL ACL];
    [acl setReadAccess:YES forUser:self.sender];
    [acl setReadAccess:YES forUser:self.receiver];
    object.ACL = acl;
    
    return object;
}


+ (Message *) fromPFObject:(PFObject *) object {
    Message *message = [[Message alloc] initWithText:object[TEXT] andReceiver:object[RECEIVER]];
    message.sender = object[SENDER];
    return message;
}

+ (void)allMessagesForLoggedInUserWithCompletion:(void (^)(NSMutableDictionary *messages, NSMutableDictionary *users, NSError *error))complete {
    PFQuery *receiverQuery = [PFQuery queryWithClassName:MESSAGE];
    [receiverQuery whereKey:RECEIVER equalTo:[PFUser currentUser]];
    
    PFQuery *senderQuery = [PFQuery queryWithClassName:MESSAGE];
    [senderQuery whereKey:SENDER equalTo:[PFUser currentUser]];
    
    PFQuery *orQuery = [PFQuery orQueryWithSubqueries:@[receiverQuery, senderQuery]];
    [orQuery orderByAscending:CREATED_AT];
    
    [orQuery findObjectsInBackgroundWithBlock:^(NSArray *messages, NSError *error) {
        NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
        NSMutableDictionary *userDict = [[NSMutableDictionary alloc] init];
        
        for (int i = 0; i < messages.count; i++) {
            Message *msg = [Message fromPFObject:messages[i]];
            PFUser *other = ([msg.sender.objectId isEqualToString:[PFUser currentUser].objectId]) ? msg.receiver : msg.sender;
            
            if (!dict[other.objectId]) {
                dict[other.objectId] = [[NSMutableArray alloc] init];
                userDict[other.objectId] = other;
            }
            
            [dict[other.objectId] addObject:msg];
        }
        
        PFQuery *userQuery = [PFUser query];
        [userQuery whereKey:@"objectId" containedIn:[userDict allKeys]];
        
        [userQuery findObjectsInBackgroundWithBlock:^(NSArray *users, NSError *error) {
            for (int i = 0; i < users.count; i++) {
                PFUser *user = users[i];
                [userDict setObject:user forKey:user.objectId];
            }
            
            complete(dict, userDict, nil);
        }];
    }];
}

+ (void)allMessagesBetweenUser:(PFUser *)user withCompletion:(void (^)(NSArray *messages, NSError *error))complete {
    
    PFQuery *receiverQuery = [PFQuery queryWithClassName:MESSAGE];
    [receiverQuery whereKey:RECEIVER equalTo:[PFUser currentUser]];
    [receiverQuery whereKey:SENDER equalTo:user];
    
    PFQuery *senderQuery = [PFQuery queryWithClassName:MESSAGE];
    [senderQuery whereKey:SENDER equalTo:[PFUser currentUser]];
    [senderQuery whereKey:RECEIVER equalTo:user];
    
    PFQuery *orQuery = [PFQuery orQueryWithSubqueries:@[receiverQuery, senderQuery]];
    [orQuery orderByAscending:CREATED_AT];
    
    [orQuery findObjectsInBackgroundWithBlock:^(NSArray *messages, NSError *error) {
        NSMutableArray *msgs = [[NSMutableArray alloc] init];
        
        for (int i = 0; i < messages.count; i++) {
            Message *msg = [Message fromPFObject:messages[i]];
            [msgs addObject:msg];
        }
        
        complete(msgs, error);
    }];
}

@end