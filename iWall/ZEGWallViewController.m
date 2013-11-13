//
//  ZEGWallViewController.m
//  iWall
//
//  Created by Евгений Заболотний on 13.11.13.
//  Copyright (c) 2013 Zabolotniy&Co. All rights reserved.
// shit happens

#import "ZEGWallViewController.h"

@interface ZEGWallViewController ()

- (IBAction)logoutPressed:(id)sender;

@end

@implementation ZEGWallViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)logoutPressed:(id)sender {
    [PFUser logOut];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
