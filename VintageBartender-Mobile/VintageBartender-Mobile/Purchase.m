//
//  Purchase.m
//  Vintage Bartender-Mobile
//
//  Created by Jon McKay on 3/24/12.
//  Copyright (c) 2012 Olin College of Engineering. All rights reserved.
//

#import "Purchase.h"

@implementation Purchase

@synthesize idNum = _idNum, createdAt = _createdAt, barfly = _barfly, drinks = _drinks;

-(id)initWithId:(NSInteger *)idNum by:(Barfly *)barfly purchased:(NSMutableArray *)drinks
{
    self = [super init];
    
    if (self != nil) {
        
        // Asign id
        _idNum = idNum;
        
        // Assign creation date
        _createdAt = [NSDate date];
        
        // Assign barfly
        _barfly = barfly;
        
        // Assign drinks
        _drinks = drinks;
        
        return self;
    }
    return nil;
}

@end
