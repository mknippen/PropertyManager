//
//  Unit.m
//  Property Manager
//
//  Created by Matthew Knippen on 11/20/13.
//  Copyright (c) 2013 Zwiffer Inc. All rights reserved.
//

#import "Unit.h"
#import <Parse/PFObject+Subclass.h>

@implementation Unit

@dynamic name, building, tenant, vacant, squareFeet, bathrooms, bedrooms, rentPrice, deposit, moveInDate, leaseStartDate, leaseEndDate, notes;

+ (NSString *)parseClassName {
    return @"Unit";
}

@end
