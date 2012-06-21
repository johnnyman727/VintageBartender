//
//  PaymentDataController.h
//  Vintage Bartender-Mobile
//
//  Created by Jon McKay on 3/28/12.
//  Copyright (c) 2012 Olin College of Engineering. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RestKit/RestKit.h"
#import "Transaction.h"

@class Payment;
@class PaymentMethod;
@class Barfly;
@class VBAllTransactionsViewController;

@interface PaymentDataController : Transaction <RKObjectLoaderDelegate, RKRequestDelegate>

@property (nonatomic, copy) NSArray *paymentList;

@property (nonatomic, retain) VBAllTransactionsViewController *vbs;

- (id)init;

- (NSInteger)countOfPaymentList;

- (Payment *)objectInPaymentListAtIndex:(NSUInteger)index;

- (void)addPayment:(Payment *)newPayment;

- (void)addPaymentListObjectWithAmount:(float)amount by:(NSInteger)barflyIdNum used:(NSString *)method;

- (void)requestPaymentListFromServer;

@end
