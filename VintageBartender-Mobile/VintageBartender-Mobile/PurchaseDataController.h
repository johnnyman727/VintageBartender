//
//  PurchaseDataController.h
//  Vintage Bartender-Mobile
//
//  Created by Jon McKay on 3/28/12.
//  Copyright (c) 2012 Olin College of Engineering. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Purchase;
@class Barfly;

@interface PurchaseDataController : NSObject <RKObjectLoaderDelegate, RKRequestDelegate>

@property (nonatomic, copy) NSArray *purchaseList;

- (NSUInteger)countOfPurchaseList;

- (Purchase *)objectInPurchaseListAtIndex:(NSUInteger)index;

- (void)addPurchaseListObjectWithId:(NSInteger *) idNum barfly:(Barfly *)barfly drinks:(NSMutableArray *)drinks;

- (void)requestPurchaseListFromServer;

@end
