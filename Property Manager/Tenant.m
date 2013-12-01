//
//  Tenant.m
//  Property Manager
//
//  Created by Matthew Knippen on 11/20/13.
//  Copyright (c) 2013 Zwiffer Inc. All rights reserved.
//

#import "Tenant.h"
#import <Parse/PFObject+Subclass.h>
#import <QuickDialog/QuickDialog.h>

@implementation Tenant

@dynamic name, unit, phone1, phone2, email, additionalTenantName, notes;

+ (NSString *)parseClassName {
    return @"Tenant";
}

@end
