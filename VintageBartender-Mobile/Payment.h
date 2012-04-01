//
//  Payment.h
//  Vintage Bartender-Mobile
//
//  Created by Jon McKay on 3/24/12.
//  Copyright (c) 2012 Olin College of Engineering. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "Barfly.h"
#include "PaymentMethod.h"

@interface Payment : NSObject

@property (nonatomic, assign) NSInteger *idNum;
@property (nonatomic, strong) NSDate *createdAt;
@property (nonatomic, copy) Barfly *barfly;
@property (nonatomic, copy)PaymentMethod *paymentMethod;
@property (nonatomic, copy)NSString *notes;

-(id)initWithId:(NSInteger *) idNum by:(Barfly *)barfly used:(PaymentMethod *) paymentMethod misc:(NSString *)notes;


@end
