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



@implementation VintageBartenderFirstViewController
@synthesize nameLabel = _nameLabel, barflyDataController=_barflyDataController, barflyTable=_barflyTable, electronicMailLabel=_electronicMailLabel, beerCountLabel = _beerCountLabel;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Set up the barfly data controller and assign it's vbc
    self.barflyDataController = [[BarflyDataController alloc] init];
    self.barflyDataController.vbc = self;
    
    // Request the barfly list
    [self.barflyDataController requestBarflyListFromServer];
}

- (void)viewDidUnload
{
    [self setNameLabel:nil];
    [self setElectronicMailLabel:nil];
    [self setBeerCountLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

#pragma mark - UI Methods
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

- (IBAction)nameLabelEditEnd:(UITextField *)sender {
    
    if (sender == self.nameLabel) {
        // Close down the table view if it's open
        [self.barflyTable setHidden:YES];
        
        // The text of the label is the name of the barfly
        NSString *barflyName = sender.text;
        
        // Var to keep track of the selected barfly
        Barfly *selectedBarfly;
        
        // If the person was selected, grab their barfly    
        for (Barfly *barfly in self.barflyDataController.barflyList) {
            if ([barfly.name isEqualToString:barflyName]) {
                selectedBarfly = barfly;
            }
        }
        
        // Else make a new one
        if (selectedBarfly == nil) {
            selectedBarfly = [[Barfly alloc] initWithName:barflyName];
        }
        
        // Set the text of the email label
        if ([selectedBarfly.email length] != 0) {
            self.electronicMailLabel.text = selectedBarfly.email;
        } else {
            self.electronicMailLabel.text = nil;
        }
    }

}

- (IBAction)nameLabelEditBegin:(UITextField *)sender {
    if (sender == self.nameLabel) {
        [self nameLabelEditChanged:sender];
    }
    else if (sender == self.electronicMailLabel) {
        self.electronicMailLabel.text = nil;
    }
}

- (IBAction)nameLabelEditChanged:(UITextField *)sender {
    // Make sure we are talking about the name label
    if (sender == self.nameLabel) {
        // If there is no text, make the table hidden
        if ([self.nameLabel.text length] == 0) {
            [self.barflyTable setHidden:YES];
            return;
        }
        // If there is text, display the table
        else {
            [self.barflyTable setHidden:NO];
            [self.view bringSubviewToFront:self.barflyTable];
            
            // Filter the table
            [self.barflyDataController filterBarflies:sender.text];
            return;
        }
        
    } 
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
    
    // Grab the selected barfly
    Barfly *selectedBarfly = [self.barflyDataController.filteredBarflyList objectAtIndex:indexPath.row];
    
    // Set the text to the name of that barfly
    self.nameLabel.text = selectedBarfly.name;
    
    // Hide the table
    [self.barflyTable setHidden:YES];
    
    // Hide the keyboard
    [self.nameLabel resignFirstResponder];
}

#pragma mark - App specific methods

- (IBAction)createCustomer:(UIButton *)sender {
    
    // If they left the name label blank, bark at them
    if ([self.nameLabel.text length] == 0) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Empty Name" 
                                                        message:@"Please enter a legit name, bro." 
                                                       delegate:nil 
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        return;
        
    }
    
    
    Barfly *newBarfly = [[Barfly alloc] initWithName:self.nameLabel.text email:self.electronicMailLabel.text];
    
    // Check if the person already exists in the database
    for (Barfly *storedBarfly in self.barflyDataController.barflyList) {
        if ([newBarfly.name isEqualToString:storedBarfly.name]) {
            // If they're already in the db, make the purchase
            [self createPurchase];
            return;
        }
        
    }
    
    // If they're not in the db, add them to the db and wait for response in order to create purchase
    [self.barflyDataController addBarfly:newBarfly];
}

- (void)createPurchase {
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    if (textField == self.nameLabel || textField == self.electronicMailLabel){
        // Put the keyboard back down
        [textField resignFirstResponder];
    }
    return YES;
}


- (IBAction)BeerAmountAction:(UIButton *)sender {
    
    // Grab the number of desired beers
    NSInteger beerCount= [self.beerCountLabel.text integerValue];
    beerCount++;
    self.beerCountLabel.text = [NSString stringWithFormat:@"%d", beerCount];
}
@end


