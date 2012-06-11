//
//  Drink.h
//  Vintage Bartender-Mobile
//
//  Created by Jon McKay on 3/24/12.
//  Copyright (c) 2012 Olin College of Engineering. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Drink : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *ingredients;
@property (nonatomic) float price;
@property int numOrdered;

- (id)initWithName:(NSString *)name costs:(float)price;
- (id)initWithName:(NSString *)name with:(NSString *)ingredients costs:(float)price;

@end
