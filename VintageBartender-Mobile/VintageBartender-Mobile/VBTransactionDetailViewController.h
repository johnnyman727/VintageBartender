//
//  TransactionDetailViewController.h
//  VintageBartender-Mobile
//
//  Created by Jon McKay on 5/9/12.
//  Copyright (c) 2012 Olin College of Engineering. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Transaction.h"

@interface VBTransactionDetailViewController : UITableViewController

@property (strong, nonatomic) Transaction *transaction;

@property (weak, nonatomic) IBOutlet UILabel *barflyName;

@property (weak, nonatomic) IBOutlet UILabel *type;

@property (weak, nonatomic) IBOutlet UILabel *amount;

@property (weak, nonatomic) IBOutlet UILabel *date;

@property (weak, nonatomic) IBOutlet UILabel *time;

@property (weak, nonatomic) IBOutlet UILabel *info;

@property (strong, nonatomic) IBOutlet UITableView *transactionDetails;

@end
