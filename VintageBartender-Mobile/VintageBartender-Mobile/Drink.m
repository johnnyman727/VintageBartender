//
//  Drink.m
//  Vintage Bartender-Mobile
//
//  Created by Jon McKay on 3/24/12.
//  Copyright (c) 2012 Olin College of Engineering. All rights reserved.
//

#import "Drink.h"

@implementation Drink

@synthesize name = _name, ingredients = _ingredients, iconPath = _iconPath, price = _price, numOrdered=_numOrdered;

-(id)initWithName:(NSString *)name with:(NSArray *)ingredients foundAt:(NSString *)iconPath costs:(float)price
{
    self = [super init];
    
    if (self != nil) {
        
        // Assign name
        _name = name;
        
        // Assign ingredients
        _ingredients = ingredients;
        
        // Assign icon path
        _iconPath = iconPath;
        
        // Assign price
        _price = price;
        
        // None have been ordered
        _numOrdered = 0;
        
        return self;
    }
    return nil;
}


@end
