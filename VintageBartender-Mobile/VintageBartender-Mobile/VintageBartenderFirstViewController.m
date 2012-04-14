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

@synthesize nameLabel = _nameLabel, barflyDataController=_barflyDataController, barflyTable=_barflyTable;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.barflyDataController = [[BarflyDataController alloc] init];
    self.barflyDataController.vbc = self;
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


- (IBAction)nameLabelEditChanged:(UITextField *)sender {
    // Make sure we are talking about the name label
    if (sender == self.nameLabel) {
        // If there is no text, make the table hidden
        if ([self.nameLabel.text length] == 0) {
            [self.barflyTable setHidden:YES];
        }
        // If there is text, display the table
        else {
            [self.barflyTable setHidden:NO];
            [self.barflyDataController filterBarflies:sender.text];
        }
        
    } 
}

- (IBAction)createCustomer:(UIButton *)sender {
    
    if ([self.nameLabel.text length] == 0) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Empty Name" 
                                                        message:@"Please enter a legit name, bro." 
                                                       delegate:nil 
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        return;
        
    }
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

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == self.nameLabel){
        [textField resignFirstResponder];
    }
    return YES;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.barflyDataController countOfBarflyList];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"BarflyCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
    }
    // Configure the cell...
    Barfly *barfly = [self.barflyDataController objectInBarflyListAtIndex:indexPath.row];
    [[cell textLabel] setText:barfly.name];
    
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end


