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
@property (nonatomic, copy) NSNumber *price;

-(id)initWithName:(NSString *)name with:(NSArray *)igredients foundAt:(NSString *)iconPath costs:(NSNumber *)price;

@end
