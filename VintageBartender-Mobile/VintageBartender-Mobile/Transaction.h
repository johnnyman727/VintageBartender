//
//  Transaction.h
//  VintageBartender-Mobile
//
//  Created by Jon McKay on 4/25/12.
//  Copyright (c) 2012 Olin College of Engineering. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Transaction : NSObject

@property (nonatomic, retain) NSDate *createdAt;

@property float amount;

@property NSInteger barflyId;

- (NSComparisonResult)compare:(Transaction *)otherObject;

@end
