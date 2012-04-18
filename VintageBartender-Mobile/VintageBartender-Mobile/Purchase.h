//
//  Purchase.h
//  Vintage Bartender-Mobile
//
//  Created by Jon McKay on 3/24/12.
//  Copyright (c) 2012 Olin College of Engineering. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Purchase : NSObject

@property NSInteger idNum;
@property (nonatomic, strong) NSDate *createdAt;
@property NSInteger barflyIdNum;
@property (nonatomic, copy) NSString *drinks;
@property float cost;
@property (nonatomic, copy) NSString *notes;

- (id)initWithDrinks:(NSString *)drinks by:(NSInteger)barflyIdNum cost:(float)cost;


@end
