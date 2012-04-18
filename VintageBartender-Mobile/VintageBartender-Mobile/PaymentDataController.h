//
//  PaymentDataController.h
//  Vintage Bartender-Mobile
//
//  Created by Jon McKay on 3/28/12.
//  Copyright (c) 2012 Olin College of Engineering. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RestKit/RestKit.h"

@class Payment;
@class PaymentMethod;
@class Barfly;

@interface PaymentDataController : NSObject <RKObjectLoaderDelegate, RKRequestDelegate>

@property (nonatomic, copy) NSArray *paymentList;

- (id)init;
- (NSInteger)countOfPaymentList;
- (Payment *)objectInPaymentListAtIndex:(NSUInteger)index;
- (void)addPayment:(Payment *)newPayment;
- (void)addPaymentListObjectWithAmount:(float)amount by:(NSInteger)barflyIdNum used:(NSString *)method;
- (void)requestPurchaseListFromServer;

@end
