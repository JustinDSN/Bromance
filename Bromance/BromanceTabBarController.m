//
//  BromanceTabBarController.m
//  Bromance
//
//  Created by Therin Irwin on 11/3/13.
//  Copyright (c) 2013 Pamela Ocampo. All rights reserved.
//

#import <Parse/Parse.h>
#import "AsyncServices.h"
#import "BromanceTabBarController.h"
#import "SplashViewController.h"
#import "Common.h"

@interface BromanceTabBarController ()

@property (strong, nonatomic) NSArray *contentVCs;

@end

@implementation BromanceTabBarController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _contentVCs = self.viewControllers;
    [[AsyncServices instance] initLocationManager];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadTabs)
                                                 name:LOG_OUT_NOTIFICATION object:nil];
    
    [self loadTabs];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

+ (BOOL)isLoggedIn {
    return [PFUser currentUser] && [[FBSession activeSession] isOpen];
}

- (void)loadTabs {
    if (![BromanceTabBarController isLoggedIn]) {
        SplashViewController *splash = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"SplashVC"];
        
        [self setViewControllers:@[splash] animated:NO];
        self.tabBar.hidden = YES;
    }
    else {
        [[AsyncServices instance] saveInitialUserData];
        [self setViewControllers:_contentVCs];
        self.tabBar.hidden = NO;
    }
}

@end