//
//  Barfly.h
//  Vintage Bartender-Mobile
//
//  Created by Jon McKay on 3/24/12.
//  Copyright (c) 2012 Olin College of Engineering. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Barfly : NSObject

@property NSInteger idNum;
@property (nonatomic, strong) NSDate *createdAt;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *email;

-(void)viewHistory;
-(void)viewPurchases;
-(void)viewPayments;
-(id)initWithName:(NSString *)name email: (NSString *)email;

@end
