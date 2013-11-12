//
//  ZEGViewController.m
//  iWall
//
//  Created by Евгений Заболотний on 12.11.13.
//  Copyright (c) 2013 Zabolotniy&Co. All rights reserved.
//

#import "ZEGViewController.h"

@interface ZEGViewController () <CommonsDelegate>

@property (strong, nonatomic) IBOutlet UIButton *loginButton;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *loginActivityIndicator;

- (IBAction)loginButtonPressed:(id)sender;

@end


@implementation ZEGViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    // Check if user is cached and linked to Facebook, if so, bypass login
    if ([PFUser currentUser] && [PFFacebookUtils isLinkedWithUser:[PFUser currentUser]]) {
        [self performSegueWithIdentifier:@"LoginSuccessful" sender:self];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginButtonPressed:(id)sender {
    // Disable the Login button to prevent multiple touches
    [self.loginButton setEnabled:NO];
    
    // Show an activity indicator
    [self.loginActivityIndicator startAnimating];
    
    // Do the login
    [ZEGCommons login:self];
}

- (void) commonsDidLogin:(BOOL)loggedIn {
	// Re-enable the Login button
	[self.loginButton setEnabled:YES];
    
	// Stop the activity indicator
	[self.loginActivityIndicator stopAnimating];
    
	// Did we login successfully ?
	if (loggedIn) {
		// Seque to the Image Wall
		[self performSegueWithIdentifier:@"LoginSuccessful" sender:self];
	} else {
		// Show error alert
		[[[UIAlertView alloc] initWithTitle:@"Login Failed"
                                    message:@"Facebook Login failed. Please try again"
                                   delegate:nil
                          cancelButtonTitle:@"Ok"
                          otherButtonTitles:nil] show];
	}
}

@end
