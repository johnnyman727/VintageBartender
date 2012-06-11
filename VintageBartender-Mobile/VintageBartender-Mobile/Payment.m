//
//  Payment.m
//  Vintage Bartender-Mobile
//
//  Created by Jon McKay on 3/24/12.
//  Copyright (c) 2012 Olin College of Engineering. All rights reserved.
//

#import "Payment.h"

@implementation Payment

@synthesize idNum = _idNum, createdAt = _createdAt, barflyId = _barflyId, method = _method, notes = _notes, amount=_amount;

-(id)initWithAmount:(float)amount by:(NSInteger)barflyIdNum used:(NSString *)method
{
    self = [super init];
    
    if (self != nil) {
        
        // Assign id (if we created it client side, for some reason)
        _idNum = -1;
        
        // Assign creation date (also if we made it client side)
        _createdAt = [NSDate date];
        
        // Assign customer
        _barflyId = barflyIdNum;
        
        // Assign payment method
        _method = method;
        
        return self;
    }
    return nil;
}

@end
