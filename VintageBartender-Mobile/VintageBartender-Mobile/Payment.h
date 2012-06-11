//
//  Payment.h
//  Vintage Bartender-Mobile
//
//  Created by Jon McKay on 3/24/12.
//  Copyright (c) 2012 Olin College of Engineering. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Transaction.h"

@interface Payment : Transaction

@property NSInteger idNum;
@property (nonatomic, strong) NSDate *createdAt;
@property NSInteger barflyId;
@property float amount;
@property (nonatomic, copy)NSString *method;
@property (nonatomic, copy)NSString *notes;

-(id)initWithAmount:(float)amount by:(NSInteger)barflyIdNum used:(NSString *)method;


@end
