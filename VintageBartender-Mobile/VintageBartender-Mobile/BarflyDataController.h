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
@class VintageBartenderFirstViewController;

@interface BarflyDataController : NSObject <RKObjectLoaderDelegate, RKRequestDelegate>

@property (nonatomic, copy) NSArray *barflyList;

@property (nonatomic, copy) NSArray *filteredBarflyList;

@property (nonatomic, retain) VintageBartenderFirstViewController *vbc;

- (id)init;

- (NSUInteger)countOfBarflyList;

- (Barfly *)objectInBarflyListAtIndex:(NSUInteger)index;

- (void)addBarfly:(Barfly *)newBarfly;

- (void)addBarflyWithName:(NSString *)name email:(NSString *)email;

- (void)requestBarflyListFromServer;

- (void)filterBarflies:(NSString *)searchText;

@end
