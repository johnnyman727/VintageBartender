//
//  VintageBartenderFirstViewController.h
//  VintageBartender-Mobile
//
//  Created by Jon McKay on 4/1/12.
//  Copyright (c) 2012 Olin College of Engineering. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BarflyDataController;

@interface VintageBartenderFirstViewController : UIViewController <UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource>
- (IBAction)BeerAmountAction:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UILabel *beerCountLabel;
- (IBAction)nameLabelEditEnd:(UITextField *)sender;
- (IBAction)nameLabelEditBegin:(UITextField *)sender;
- (IBAction)nameLabelEditChanged:(UITextField *)sender;
- (IBAction)createCustomer:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UITextField *nameLabel;

@property (strong, nonatomic) BarflyDataController *barflyDataController;

@property (nonatomic, retain) IBOutlet UITextField *electronicMailLabel;

@property (nonatomic, retain) IBOutlet UITableView *barflyTable;


@end
