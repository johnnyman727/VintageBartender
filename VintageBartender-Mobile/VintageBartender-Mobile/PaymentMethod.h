//
//  PaymentMethod.h
//  Vintage Bartender-Mobile
//
//  Created by Jon McKay on 3/24/12.
//  Copyright (c) 2012 Olin College of Engineering. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PaymentMethod : NSObject

@property (nonatomic, copy) NSString *methodName;

@property (nonatomic, assign) NSNumber *amount;

@end
