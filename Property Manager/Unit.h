//
//  Unit.h
//  Property Manager
//
//  Created by Matthew Knippen on 11/20/13.
//  Copyright (c) 2013 Zwiffer Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Building, Tenant;

@interface Unit : PFObject <PFSubclassing>

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) Building *building;
@property (nonatomic, strong) Tenant *tenant;
@property (nonatomic) int sort;
@property (nonatomic) BOOL vacant;
@property (nonatomic) int squareFeet;
@property (nonatomic) int bedrooms;
@property (nonatomic) float bathrooms;
@property (nonatomic) float rentPrice;
@property (nonatomic) float deposit;
@property (nonatomic, strong) NSDate *moveInDate;
@property (nonatomic, strong) NSDate *leaseStartDate;
@property (nonatomic, strong) NSDate *leaseEndDate;
@property (nonatomic, strong) NSString *notes;

@end