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
#import "Drink.h"
#import "Purchase.h"
#import "PurchaseDataController.h"



@implementation VintageBartenderFirstViewController
@synthesize nameLabel = _nameLabel, barflyDataController=_barflyDataController, barflyTable=_barflyTable, electronicMailLabel=_electronicMailLabel, drinkTable=_drinkTable, drinks=_drinks, totalCostLabel = _totalCostLabel, purchaseDataController=_purchaseDataController;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Set up the barfly data controller and assign it's vbc
    self.barflyDataController = [[BarflyDataController alloc] init];
    self.barflyDataController.vbc = self;
    
    // Request the barfly list
    [self.barflyDataController requestBarflyListFromServer];
    
    // Set up the purchase data controller
    self.purchaseDataController = [[PurchaseDataController alloc] init];
    
    // Temp Create drinks
    self.drinks = [[NSMutableArray alloc] initWithCapacity:5];
    for (int i = 0; i < 4; i++) {
        Drink *newDrink = [[Drink alloc] initWithName:[NSString stringWithFormat:@"Martini %d", i] with:nil foundAt:nil costs:1.50];
        [self.drinks addObject:newDrink];
    }
}

- (void)viewDidUnload
{
    [self setNameLabel:nil];
    [self setElectronicMailLabel:nil];
    [self setDrinkTable:nil];
    [self setTotalCostLabel:nil];
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
    if (tableView == self.barflyTable) {
        return [self.barflyDataController countOfBarflyList];
    }
    if (tableView == self.drinkTable) {
        return self.drinks.count;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.barflyTable) {
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
    
    if (tableView == self.drinkTable) {
        static NSString *CellIdentifier = @"DrinkCell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            
        }
        
        // Configure the cell...
        Drink *drink = [self.drinks objectAtIndex:indexPath.row];
        [[cell textLabel] setText:[NSString stringWithFormat:@"%@ - $%.2f", drink.name, drink.price]];
        [[cell detailTextLabel] setText:[NSString stringWithFormat:@"%d", drink.numOrdered]];
        
        return cell;
    }
    return nil;
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
    
    if (tableView == self.barflyTable) {
        // Grab the selected barfly
        Barfly *selectedBarfly = [self.barflyDataController.filteredBarflyList objectAtIndex:indexPath.row];

        // Set the text to the name of that barfly
        self.nameLabel.text = selectedBarfly.name;

        // Hide the table
        [self.barflyTable setHidden:YES];

        // Hide the keyboard
        [self.nameLabel resignFirstResponder];
    }
    
    else if (tableView == self.drinkTable) {
        
        // Grab the drink
        Drink *drink = [self.drinks objectAtIndex:indexPath.row];
        
        // Update the number ordered of that drink
        drink.numOrdered++;
        
        // Update total price
        self.totalCostLabel.text =  [NSString stringWithFormat:@"%.2f", [self.totalCostLabel.text floatValue] + drink.price];
        
        // Update the table
        [self.drinkTable reloadData];
    }
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
            [self createPurchase:storedBarfly];
            return;
        }
        
    }
    
    // If they're not in the db, add them to the db and wait for response in order to create purchase
    [self.barflyDataController addBarfly:newBarfly];
}

- (void)createPurchase:(Barfly *)customer {
    
    // Create the purchase name (csv of all purchases)
    NSString *drinks = @"";
 
# warning This for loop doesn't format the strings correctly.
    for (int i = 0; i < self.drinks.count; i++) {
        
        Drink *drink = [self.drinks objectAtIndex:i];
        for (int j =0; j < drink.numOrdered; j++) {
            if (i != 0) {
                drinks = [drinks stringByAppendingString:@","];
            }
            drinks = [drinks stringByAppendingString:drink.name];
        }
    }
    
# warning The float value is always a bit off on the server.
    [self.purchaseDataController addPurchaseListObjectWithDrinks:drinks by:customer.idNum cost:[self.totalCostLabel.text floatValue]];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    if (textField == self.nameLabel || textField == self.electronicMailLabel){
        // Put the keyboard back down
        [textField resignFirstResponder];
    }
    return YES;
}

@end


