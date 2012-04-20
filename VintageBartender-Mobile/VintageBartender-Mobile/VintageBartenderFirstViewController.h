//
//  VintageBartenderFirstViewController.h
//  VintageBartender-Mobile
//
//  Created by Jon McKay on 4/1/12.
//  Copyright (c) 2012 Olin College of Engineering. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BarflyDataController;
@class PurchaseDataController;

@interface VintageBartenderFirstViewController : UIViewController <UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UILabel *totalCostLabel;

- (IBAction)nameLabelEditEnd:(UITextField *)sender;

- (IBAction)nameLabelEditBegin:(UITextField *)sender;

- (IBAction)nameLabelEditChanged:(UITextField *)sender;

- (IBAction)createCustomer:(UIButton *)sender;

@property (strong, nonatomic) NSMutableArray *drinks;

@property (weak, nonatomic) IBOutlet UITextField *nameLabel;

@property (strong, nonatomic) BarflyDataController *barflyDataController;

@property (strong, nonatomic) PurchaseDataController *purchaseDataController;

@property (nonatomic, retain) IBOutlet UITextField *electronicMailLabel;

@property (nonatomic, retain) IBOutlet UITableView *barflyTable;

@property (weak, nonatomic) IBOutlet UITableView *drinkTable;

@end
