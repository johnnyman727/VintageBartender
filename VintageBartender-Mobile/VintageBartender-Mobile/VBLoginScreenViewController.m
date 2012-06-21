//
//  VBLoginScreenViewController.m
//  VintageBartender-Mobile
//
//  Created by Jon McKay on 6/20/12.
//  Copyright (c) 2012 Olin College of Engineering. All rights reserved.
//

#import "VBLoginScreenViewController.h"

@interface VBLoginScreenViewController ()

@end

@implementation VBLoginScreenViewController
@synthesize bartenderNameTextField;
@synthesize bartenderPasswordTextField;
@synthesize barNameTextField;
@synthesize submitCredentialsButton;

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

- (void)viewDidUnload
{
    [self setBartenderNameTextField:nil];
    [self setBartenderPasswordTextField:nil];
    [self setBarNameTextField:nil];
    [self setSubmitCredentialsButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(void)performSegueWithIdentifier:(NSString *)identifier {
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    if (textField == self.barNameTextField || textField == self.bartenderNameTextField || self.barNameTextField){
        // Put the keyboard back down
        [textField resignFirstResponder];
    }
    return YES;
}

@end
