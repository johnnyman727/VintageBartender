//
//  BarflyDataController.h
//  Vintage Bartender-Mobile
//
//  Created by Jon McKay on 3/28/12.
//  Copyright (c) 2012 Olin College of Engineering. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RestKit/RestKit.h"

@class Barfly;

@interface BarflyDataController : NSObject <RKObjectLoaderDelegate, RKRequestDelegate>

@property (nonatomic, copy) NSMutableArray *barflyList;

- (NSUInteger)countOfBarflyList;
- (Barfly *)objectInBarflyListAtIndex:(NSUInteger)index;
- (void)addBarflyWithName:(NSString *)name email:(NSString *)email;
- (void)requestBarflyListFromServer;
- (id)init;
@end
