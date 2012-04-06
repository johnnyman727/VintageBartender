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
@property NSInteger cost;
@property (nonatomic, copy) NSString *notes;

-(id)initWithId:(NSInteger) idNum by:(NSInteger)bardlyIdNum purchased:(NSString *) drinks cost:(NSInteger )cost notes:(NSString *)notes;


@end
