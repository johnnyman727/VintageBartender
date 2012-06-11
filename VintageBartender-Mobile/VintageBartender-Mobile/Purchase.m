//
//  Purchase.m
//  Vintage Bartender-Mobile
//
//  Created by Jon McKay on 3/24/12.
//  Copyright (c) 2012 Olin College of Engineering. All rights reserved.
//

#import "Purchase.h"

@implementation Purchase

@synthesize idNum = _idNum, createdAt = _createdAt, barflyId=_barflyId, drinks = _drinks, amount = _amount, notes = _notes;

- (id)initWithDrinks:(NSString *)drinks by:(NSInteger)barflyIdNum cost:(float)cost;
{
    self = [super init];
    
    if (self != nil) {
        
        // Asign id (-1 if we made it on the client for some reason)
        _idNum = -1;
        
        // Assign creation date (now, if we made it on the client)
        _createdAt = [NSDate date];
        
        // Assign barfly id
        _barflyId = barflyIdNum;
        
        // Assign drinks
        _drinks = drinks;
        
        // Assign cost
        _amount = round(3.0f * cost)/3.0f;
        
        return self;
    }
    return nil;
}

@end
