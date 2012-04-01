//
//  CreditCardPayment.h
//  Vintage Bartender-Mobile
//
//  Created by Jon McKay on 3/24/12.
//  Copyright (c) 2012 Olin College of Engineering. All rights reserved.
//

#import "PaymentMethod.h"

@interface CreditCardPayment : PaymentMethod

// eg. Venmo, Paypal, Square, etc.
@property (copy) NSString *paymentManager;

@end
