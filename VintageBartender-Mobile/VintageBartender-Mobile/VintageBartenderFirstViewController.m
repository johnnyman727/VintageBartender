//
//  VintageBartenderFirstViewController.m
//  VintageBartender-Mobile
//
//  Created by Jon McKay on 4/1/12.
//  Copyright (c) 2012 Olin College of Engineering. All rights reserved.
//

#import "VintageBartenderFirstViewController.h"
#import "Barfly.h"
#import "BarflyDataController.h"

@interface VintageBartenderFirstViewController ()

@end

@implementation VintageBartenderFirstViewController

@synthesize nameLabel = _nameLabel, barflyDataController=_barflyDataController;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.barflyDataController = [[BarflyDataController alloc] init];
    [self.barflyDataController requestBarflyListFromServer];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setNameLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}


- (IBAction)createCustomer:(UIButton *)sender {
    
    Barfly *newBarfly = [[Barfly alloc] initWithName:self.nameLabel.text email:@"Test.ing@students.olin.edu"];
    
    // Check if the person already exists in the database
    for (Barfly *storedBarfly in self.barflyDataController.barflyList) {
        if ([newBarfly.name isEqualToString:storedBarfly.name]) {
            // If they're already in the db, make the purchase
            [self createPurchase];
            return;
        }
        
    }
    // If they're not in the db, add them to the db and wait for response in order to create purchase
    [self.barflyDataController addBarflyWithName:self.nameLabel.text email:@"Test.ing@students.olin.edu"];
}

- (void)createPurchase {
    
}

- (IBAction)nameLabelEditBegin:(UITextField *)sender {
    self.nameLabel.text = @"Testing For Realz";
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == self.nameLabel){
        [textField resignFirstResponder];
    }
    return YES;
}
@end


