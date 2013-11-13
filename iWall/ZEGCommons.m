//
//  ZEGCommons.m
//  iWall
//
//  Created by Евгений Заболотний on 13.11.13.
//  Copyright (c) 2013 Zabolotniy&Co. All rights reserved.

#import "ZEGCommons.h"

@implementation ZEGCommons

+ (void) login:(id<CommonsDelegate>)delegate
{
	// Basic User information and your friends are part of the standard permissions
	// so there is no reason to ask for additional permissions
    
	[PFFacebookUtils logInWithPermissions:nil block:^(PFUser *user, NSError *error) {
		// Was login successful ?
		if (!user) {
			if (!error) {
                NSLog(@"The user cancelled the Facebook login.");
            } else {
                NSLog(@"An error occurred: %@", error.localizedDescription);
            }
            
			// Callback - login failed
			if ([delegate respondsToSelector:@selector(commonsDidLogin:)]) {
				[delegate commonsDidLogin:NO];
			}
		} else {
			if (user.isNew) {
				NSLog(@"User signed up and logged in through Facebook!");
			} else {
				NSLog(@"User logged in through Facebook!");
			}
            
			// Callback - login successful
			if ([delegate respondsToSelector:@selector(commonsDidLogin:)]) {
				[delegate commonsDidLogin:YES];
			}
		}
	}];
}

@end
