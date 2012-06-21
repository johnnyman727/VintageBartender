//
//  VintageBartenderSecondViewController.h
//  VintageBartender-Mobile
//
//  Created by Jon McKay on 4/1/12.
//  Copyright (c) 2012 Olin College of Engineering. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PurchaseDataController;
@class PaymentDataController;
@class BarflyDataController;

@interface VBAllTransactionsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, retain) NSMutableArray *transactionList;

@property (nonatomic, retain) PurchaseDataController *purchaseDataController;

@property (nonatomic, retain) PaymentDataController *paymentDataController;

@property (nonatomic, retain) BarflyDataController *barflyDataController;

- (void)requestTransactions;

-(void)transactionsLoaded:(NSArray *)transactions;

@property (strong, nonatomic) IBOutlet UITableView *transactionTable;

@end
