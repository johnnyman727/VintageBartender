//
//  Purchase.h
//  Vintage Bartender-Mobile
//
//  Created by Jon McKay on 3/24/12.
//  Copyright (c) 2012 Olin College of Engineering. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Transaction.h"

@interface Purchase : Transaction

@property NSInteger idNum;
@property (nonatomic, strong) NSDate *createdAt;
@property NSInteger barflyId;
@property (nonatomic, copy) NSString *drinks;
@property float amount;
@property (nonatomic, copy) NSString *notes;

- (id)initWithDrinks:(NSString *)drinks by:(NSInteger)barflyIdNum cost:(float)cost;


@end
