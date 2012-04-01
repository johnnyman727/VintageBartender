//
//  PaymentDataController.h
//  Vintage Bartender-Mobile
//
//  Created by Jon McKay on 3/28/12.
//  Copyright (c) 2012 Olin College of Engineering. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Payment;
@class PaymentMethod;
@class Barfly;

@interface PaymentDataController : NSObject

@property (nonatomic, copy) NSMutableArray *paymentList;

-(NSInteger)countOfPaymentList;
-(Payment *)objectInPaymentListAtIndex:(NSUInteger)index;
-(void)addPaymentListObjectWithId:(NSInteger *)idNum barfly:(Barfly *)barfly payment:(PaymentMethod *)paymentMethod notes:(NSString *)notes;
-(void)requestPurchaseListFromServer;

@end
