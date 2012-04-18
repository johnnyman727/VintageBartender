//
//  PaymentDataController.m
//  Vintage Bartender-Mobile
//
//  Created by Jon McKay on 3/28/12.
//  Copyright (c) 2012 Olin College of Engineering. All rights reserved.
//

#import "PaymentDataController.h"
#import "Barfly.h"
#import "Purchase.h"
#import "Payment.h"


@implementation PaymentDataController

@synthesize paymentList = _paymentList;

- (id)init {
    if (self = [super init]) {
        return self;
    }
    return nil;
}

- (NSInteger)countOfPaymentList {
    return [self.paymentList count];
}

- (Payment *)objectInPaymentListAtIndex:(NSUInteger)index {
    return [self.paymentList objectAtIndex:index];
}

- (void)addPayment:(Payment *)newPayment {
    
    [[RKObjectManager sharedManager] postObject:newPayment delegate:self];
}
 
- (void)addPaymentListObjectWithAmount:(float)amount by:(NSInteger)barflyIdNum used:(NSString *)method {
    
    Payment *payment;
    
    payment = [[Payment alloc] initWithAmount:amount by:barflyIdNum used:method];
    
    [self addPayment:payment];
}

- (void)requestPurchaseListFromServer {
    
   // Request the list from the server 
   [[RKObjectManager sharedManager] loadObjectsAtResourcePath:@"/payments" delegate:self];
}

- (void)objectLoader:(RKObjectLoader*)objectLoader didLoadObjects:(NSArray*)objects {
    
    //RKLogInfo(@"Load collection of Purchases: %@", objects);
    
    self.paymentList = objects;
}

- (void)objectLoader:(RKObjectLoader *)objectLoader didFailWithError:(NSError *)error {
    
    RKLogInfo(@"Load collection of Purchases FAILED: %@", error);
}

@end
