//
//  Payment.m
//  Vintage Bartender-Mobile
//
//  Created by Jon McKay on 3/24/12.
//  Copyright (c) 2012 Olin College of Engineering. All rights reserved.
//

#import "Payment.h"

@implementation Payment

@synthesize idNum = _idNum, createdAt = _createdAt, barfly = _barfly, paymentMethod = _paymentMethod, notes = _notes;

-(id)initWithId:(NSInteger *)idNum by:(Barfly *)barfly used:(PaymentMethod *)paymentMethod misc:(NSString *)notes
{
    self = [super init];
    
    if (self != nil) {
        
        // Assign id
        _idNum = idNum;
        
        // Assign creation date
        _createdAt = [NSDate date];
        
        // Assign customer
        _barfly = barfly;
        
        // Assign payment method
        _paymentMethod = paymentMethod;
        
        // Assign any notes
        _notes = notes;
        
        return self;
    }
    return nil;
}

@end
