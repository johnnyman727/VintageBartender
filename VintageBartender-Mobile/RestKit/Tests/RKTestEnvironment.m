//
//  RKTestEnvironment.m
//  RestKit
//
//  Created by Blake Watters on 3/14/11.
//  Copyright 2011 RestKit
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

#include <objc/runtime.h>
#import "RKTestEnvironment.h"
#import "RKParserRegistry.h"

RKOAuthClient* RKTestNewOAuthClient(RKTestResponseLoader* loader){
    [loader setTimeout:10];
    RKOAuthClient* client = [RKOAuthClient clientWithClientID:@"appID" secret:@"appSecret"];
    client.delegate = loader;
    client.authorizationURL = [NSString stringWithFormat:@"%@/oauth/authorize", [RKTestFactory baseURLString]];
    return client;
}

void RKTestClearCacheDirectory(void) {
    
}

@implementation RKTestCase

+ (void)initialize
{
    NSBundle *fixtureBundle = [NSBundle bundleWithIdentifier:@"org.restkit.unit-tests"];
    [RKTestFixture setFixtureBundle:fixtureBundle];
}

@end

@implementation SenTestCase (MethodSwizzling)
- (void)swizzleMethod:(SEL)aOriginalMethod
              inClass:(Class)aOriginalClass
           withMethod:(SEL)aNewMethod
            fromClass:(Class)aNewClass
         executeBlock:(void (^)(void))aBlock {
    Method originalMethod = class_getClassMethod(aOriginalClass, aOriginalMethod);
    Method mockMethod = class_getInstanceMethod(aNewClass, aNewMethod);
    method_exchangeImplementations(originalMethod, mockMethod);
    aBlock();
    method_exchangeImplementations(mockMethod, originalMethod);
}
@end
