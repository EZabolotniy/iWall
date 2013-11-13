//
//  ZEGCommons.h
//  iWall
//
//  Created by Евгений Заболотний on 13.11.13.
//  Copyright (c) 2013 Zabolotniy&Co. All rights reserved.

@protocol CommonsDelegate <NSObject>

@optional
- (void) commonsDidLogin:(BOOL)loggedIn;

@end

@interface ZEGCommons : NSObject

+ (void) login:(id<CommonsDelegate>)delegate;

@end
