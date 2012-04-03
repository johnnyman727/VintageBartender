//
//  PaymentDataController.m
//  Vintage Bartender-Mobile
//
//  Created by Jon McKay on 3/28/12.
//  Copyright (c) 2012 Olin College of Engineering. All rights reserved.
//

#import "PaymentDataController.h"
#import "Barfly.h"
#import "PaymentMethod.h"
#import "Purchase.h"
#import "Payment.h"

@interface PaymentDataController()
-(void)sendPaymentToServer:(Payment *)newPayment;
@end

@implementation PaymentDataController

@synthesize paymentList = _paymentList;

-(id)init {
    if (self = [super init]) {
        _paymentList = [NSMutableArray init];
        return self;
    }
    return nil;
}

-(NSInteger)countOfPaymentList {
    return [self.paymentList count];
}

-(Payment *)objectInPaymentListAtIndex:(NSUInteger)index {
    return [self.paymentList objectAtIndex:index];
}
 
-(void)addPaymentListObjectWithId:(NSInteger *)idNum barfly:(Barfly *)barfly payment:(PaymentMethod *)paymentMethod notes:(NSString *)notes {
    Payment *payment;
    
    payment = [[Payment alloc] initWithId:idNum by:barfly used:paymentMethod misc:notes];
    
    [self sendPaymentToServer:payment];
}

-(void)requestPurchaseListFromServer {

   
}

-(void)sendPaymentToServer:(Payment *)newPayment {

    
}

@end
