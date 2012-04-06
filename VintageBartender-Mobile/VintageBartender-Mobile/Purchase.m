//
//  Purchase.m
//  Vintage Bartender-Mobile
//
//  Created by Jon McKay on 3/24/12.
//  Copyright (c) 2012 Olin College of Engineering. All rights reserved.
//

#import "Purchase.h"

@implementation Purchase

@synthesize idNum = _idNum, createdAt = _createdAt, barflyIdNum=_barflyIdNum, drinks = _drinks, cost = _cost, notes = _notes;

-(id)initWithId:(NSInteger) idNum by:(NSInteger)barflyIdNum purchased:(NSString *) drinks cost:(NSInteger)cost notes:(NSString *)notes
{
    self = [super init];
    
    if (self != nil) {
        
        // Asign id
        _idNum = idNum;
        
        // Assign creation date
        _createdAt = [NSDate date];
        
        // Assign barfly id
        _barflyIdNum = barflyIdNum;
        
        // Assign drinks
        _drinks = drinks;
        
        // Assign notes
        notes = _notes;
        
        return self;
    }
    return nil;
}

@end
