//
//  DrinkDataController.h
//  VintageBartender-Mobile
//
//  Created by Jon McKay on 4/24/12.
//  Copyright (c) 2012 Olin College of Engineering. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Restkit/RestKit.h"

@class Drink;

@interface DrinkDataController : NSObject <RKObjectLoaderDelegate, RKRequestDelegate>

@property (nonatomic, copy) NSArray *drinkList;

- (id)init;
- (NSInteger)countOfDrinkList;
- (Drink *)objectInDrinkListAtIndex:(NSUInteger)index;
- (void)addDrink:(Drink *)newDrink;
- (void)addDrinkListObjectWithName:(NSString *)name cost:(float)price;
- (void)requestDrinkListFromServer;

@end
