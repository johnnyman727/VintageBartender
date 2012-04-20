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
@property (nonatomic, copy) NSArray *ingredients;
@property (nonatomic, copy)NSString *iconPath;
@property (nonatomic) float price;
@property int numOrdered;

-(id)initWithName:(NSString *)name with:(NSArray *)ingredients foundAt:(NSString *)iconPath costs:(float)price;

@end
