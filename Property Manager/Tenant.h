//
//  Tenant.h
//  Property Manager
//
//  Created by Matthew Knippen on 11/20/13.
//  Copyright (c) 2013 Zwiffer Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Unit;

@interface Tenant : PFObject <PFSubclassing>

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) Unit *unit;
@property (nonatomic, strong) NSString *phone1;
@property (nonatomic, strong) NSString *phone2;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *additionalTenantName;
@property (nonatomic, strong) NSString *notes;


@end