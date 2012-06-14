//
//  Transaction.m
//  VintageBartender-Mobile
//
//  Created by Jon McKay on 4/25/12.
//  Copyright (c) 2012 Olin College of Engineering. All rights reserved.
//

#import "Transaction.h"

@implementation Transaction

@synthesize createdAt=_createdAt, amount=_amount, barflyId=_barflyId;

- (id)init {
    if (self = [super init]) {
        return self;
    }
    return nil;
}

- (NSComparisonResult)compare:(Transaction *)otherObject {
    return ([self.createdAt compare:otherObject.createdAt]);
}


@end
