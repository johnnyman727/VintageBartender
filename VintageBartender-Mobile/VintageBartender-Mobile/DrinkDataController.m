//
//  DrinkDataController.m
//  VintageBartender-Mobile
//
//  Created by Jon McKay on 4/24/12.
//  Copyright (c) 2012 Olin College of Engineering. All rights reserved.
//

#import "DrinkDataController.h"
#import "Drink.h"

@implementation DrinkDataController

@synthesize drinkList=_drinkList;

- (id)init {
    if (self = [super init]) {
        return self;
    }
    return nil;
}

- (NSInteger)countOfDrinkList {
    return [self.drinkList count];
}

- (Drink *)objectInDrinkListAtIndex:(NSUInteger)index {
    return [self.drinkList objectAtIndex:index];
}

- (void)addDrink:(Drink *)newDrink {
    
    [[RKObjectManager sharedManager] postObject:newDrink delegate:self];
}

-(void)addDrinkListObjectWithName:(NSString *)name cost:(float)price {
    
    Drink *drink;
    
    drink = [[Drink alloc] initWithName:name costs:price];
    
    [self addDrink:drink];
}

- (void)requestDrinkListFromServer {
    
    // Request the list from the server 
    [[RKObjectManager sharedManager] loadObjectsAtResourcePath:@"/drinks" delegate:self];
}

- (void)objectLoader:(RKObjectLoader*)objectLoader didLoadObjects:(NSArray*)objects {
    
    RKLogInfo(@"Load collection of Drinks: %@", objects);
    
    self.drinkList = objects;
}

- (void)objectLoader:(RKObjectLoader *)objectLoader didFailWithError:(NSError *)error {
    
    RKLogInfo(@"Load collection of Purchases FAILED: %@", error);
}

@end
