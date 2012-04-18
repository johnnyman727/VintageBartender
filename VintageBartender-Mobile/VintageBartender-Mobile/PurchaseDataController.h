//
//  PurchaseDataController.h
//  Vintage Bartender-Mobile
//
//  Created by Jon McKay on 3/28/12.
//  Copyright (c) 2012 Olin College of Engineering. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RestKit/RestKit.h"

@class Purchase;
@class Barfly;

@interface PurchaseDataController : NSObject <RKObjectLoaderDelegate, RKRequestDelegate>

@property (nonatomic, copy) NSArray *purchaseList;

- (id)init;

- (NSUInteger)countOfPurchaseList;

- (Purchase *)objectInPurchaseListAtIndex:(NSUInteger)index;

- (void)addPurchase:(Purchase *)newPurchase;

- (void)addPurchaseListObjectWithDrinks:(NSString *)drinks by:(NSInteger)barflyIdNum cost:(float)cost;

- (void)requestPurchaseListFromServer;

@end
