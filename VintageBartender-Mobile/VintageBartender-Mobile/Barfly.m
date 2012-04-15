//
//  Barfly.m
//  Vintage Bartender-Mobile
//
//  Created by Jon McKay on 3/24/12.
//  Copyright (c) 2012 Olin College of Engineering. All rights reserved.
//

#import "Barfly.h"

@interface Barfly() 
-(NSString *)createDefaultEmail;
@end

@implementation Barfly 

@synthesize idNum = _idNum, createdAt = _createdAt, name = _name, email = _email, amountOwed = _amountOwed, updatedAt = _updatedAt;
   
-(void)viewHistory
{
    
}

-(void)viewPurchases
{
    
}

-(void)viewPayments
{
    
}

- (id) initWithName:(NSString *)name {
    
    // Set the name
    _name = name;
    
    // Create an email
    NSString *email = [self createDefaultEmail];
    
    // Call the bigger init
    return [self initWithName:name email:email];
}

- (id)initWithName:(NSString *)name email:(NSString *)email
{
    self = [super init];
    
    if (self != nil) {
        
        // TODO: Actually get idNum
        _idNum = 5;
        
        // Set up time person was created
        _createdAt = [NSDate date];
        
        // Set up name
        _name = name;
        
        // No email was provided so leave it null
        _email = email;
        
        // Don't owe anything yet
        _amountOwed = 0.0;
        
        // Just Updated
        _updatedAt = _createdAt;
        
        return self;
    }
    return (nil);
}

- (NSString *)createDefaultEmail{
    
    // Seperate the name into parts
    NSArray *nameComponents = [[NSArray alloc] initWithArray:[self.name componentsSeparatedByString:@" "]];
    
    @try {
        // Format the string
        return [NSString stringWithFormat:@"%@.%@@students.olin.edu", [nameComponents objectAtIndex:0], [nameComponents objectAtIndex:1]];

    }
    @catch (NSException *exception) {
        return nil;
    }
}

@end
