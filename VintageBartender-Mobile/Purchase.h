//
//  Purchase.h
//  Vintage Bartender-Mobile
//
//  Created by Jon McKay on 3/24/12.
//  Copyright (c) 2012 Olin College of Engineering. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "Barfly.h"

@interface Purchase : NSObject

@property NSInteger *idNum;
@property (nonatomic, strong) NSDate *createdAt;
@property (nonatomic, copy) Barfly *barfly;
@property (nonatomic, copy) NSMutableArray *drinks;

-(id)initWithId:(NSInteger *) idNum by:(Barfly *)barfly purchased:(NSMutableArray *) drinks;


@end
