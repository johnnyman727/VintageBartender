//
//  Drink.m
//  Vintage Bartender-Mobile
//
//  Created by Jon McKay on 3/24/12.
//  Copyright (c) 2012 Olin College of Engineering. All rights reserved.
//

#import "Drink.h"

@implementation Drink

@synthesize name = _name, ingredients = _ingredients, iconPath = _iconPath, price = _price;

-(id)initWithName:(NSString *)name with:(NSArray *)igredients foundAt:(NSString *)iconPath costs:(NSNumber *)price
{
    self = [super init];
    
    if (self != nil) {
        
        // Assign name
        _name = name;
        
        // Assign ingredients
        _ingredients = igredients;
        
        // Assign icon path
        _iconPath = iconPath;
        
        // Assign price
        _price = price;
        
        return self;
    }
    return nil;
}


@end
