//
//  PurchaseDataController.m
//  Vintage Bartender-Mobile
//
//  Created by Jon McKay on 3/28/12.
//  Copyright (c) 2012 Olin College of Engineering. All rights reserved.
//

#import "PurchaseDataController.h"
#import "Purchase.h"

@interface PurchaseDataController ()
-(void) sendPurchaseToServer:(Purchase *)newPurchase; 
@end

@implementation PurchaseDataController

@synthesize purchaseList = _purchaseList;

-(id)init {
    if (self = [super init]) {
        _purchaseList = [NSMutableArray init];
        return self;
    }
    return nil;
}

-(NSUInteger)countOfPurchaseList {
    return [self.purchaseList count];
}

-(Purchase *)objectInPurchaseListAtIndex:(NSUInteger)index {
    return [self.purchaseList objectAtIndex:index];
}

-(void)addPurchaseListObjectWithId:(NSInteger *)idNum barfly:(Barfly *)barfly drinks:(NSMutableArray *)drinks{
    Purchase *purchase;
    
    purchase = [[Purchase alloc] initWithId:idNum by:barfly purchased:drinks];
    
    [self sendPurchaseToServer:purchase];
}

-(void)requestPurchaseListFromServer {

    
}

-(void)sendPurchaseToServer:(Purchase *)newPurchase {

   
}

@end
