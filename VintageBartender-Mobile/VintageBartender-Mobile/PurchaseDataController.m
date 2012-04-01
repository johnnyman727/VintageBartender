//
//  PurchaseDataController.m
//  Vintage Bartender-Mobile
//
//  Created by Jon McKay on 3/28/12.
//  Copyright (c) 2012 Olin College of Engineering. All rights reserved.
//

#import "PurchaseDataController.h"
#import "Purchase.h"
#import "NetworkDataController.h"

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
    // Format string to send to server
    NSString *jsonString = @"MAKEREALJSONSTRINGHERE";
    
    // Send it off to the network controller
    [NetworkDataController sendDataToServerFromJSON:jsonString];
}

-(void)sendPurchaseToServer:(Purchase *)newPurchase {
    // Format string to send to server
    NSString *jsonString = @"MAKEREALJSONSTRINGHERE";
    
    // Send it off to the network controller
    [NetworkDataController sendDataToServerFromJSON:jsonString];
}

@end
