    //
//  VintageBartenderSecondViewController.m
//  VintageBartender-Mobile
//
//  Created by Jon McKay on 4/1/12.
//  Copyright (c) 2012 Olin College of Engineering. All rights reserved.
//

#import "VBAllTransactionsViewController.h"
#import "PaymentDataController.h"
#import "PurchaseDataController.h"
#import "BarflyDataController.h"
#import "Barfly.h"
#import "VBTransactionDetailViewController.h"

@interface VBAllTransactionsViewController ()

@end

@implementation VBAllTransactionsViewController
@synthesize transactionTable=_transactionTable, paymentDataController=_paymentDataController, purchaseDataController=_purchaseDataController, transactionList=_transactionList,barflyDataController=_barflyDataController;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.paymentDataController = [[PaymentDataController alloc] init];
    self.purchaseDataController = [[PurchaseDataController alloc] init];
    self.barflyDataController = [[BarflyDataController alloc] init];
    
    [self.barflyDataController requestBarflyListFromServer];
    self.transactionList = [[NSMutableArray alloc] initWithArray:nil];
    
    [self requestTransactions];
}

- (void)viewDidUnload
{
    [self setTransactionTable:nil];
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

-(void)requestTransactions {
    
    [self.purchaseDataController requestPurchaseListFromServer];
    self.purchaseDataController.vbs = self;
    
    [self.paymentDataController requestPaymentListFromServer];
    self.paymentDataController.vbs = self;
}

-(void)transactionsLoaded:(NSArray *)transactions {
    
    // Add the objects (either purchases or payments
    [self.transactionList addObjectsFromArray:transactions];
    
    // Sort the transactions based on date
    NSSortDescriptor *dateSortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"createdAt" ascending:NO selector:@selector(compare:)];
    [self.transactionList sortUsingDescriptors:[NSArray arrayWithObjects:dateSortDescriptor, nil]];
    
    [self.transactionTable reloadData];
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if (tableView == self.transactionTable) {
        return [self.transactionList count];
    }

    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.transactionTable) {
        static NSString *CellIdentifier = @"transactionCell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            
        }
        
        // Configure the cell...
        
        Transaction *transaction = [self.transactionList objectAtIndex:indexPath.row];
        
        [[cell textLabel] setText:@"Unknown Person!"];
        
        for (Barfly *barfly in self.barflyDataController.barflyList) {
            if (transaction.barflyId == barfly.idNum) {
                [[cell textLabel] setText:barfly.name];
            }
        }
        
        [[cell detailTextLabel] setText:[transaction.createdAt description]];
        
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
    if (self.navigationController == nil) {
        NSLog(@"Fuck FUck UFKFKCU");
    }

        VBTransactionDetailViewController *transactionDetailViewController = [[VBTransactionDetailViewController alloc] initWithStyle:UITableViewStyleGrouped];
        [self.navigationController pushViewController:transactionDetailViewController animated:YES];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"ShowTransactionDetails"]) {
        VBTransactionDetailViewController *transactionViewController = [segue destinationViewController];
        
        transactionViewController.transaction = [self.transactionList objectAtIndex:[self.transactionTable indexPathForSelectedRow].row];
    }
}

@end
