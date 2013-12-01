//
//  Unit.m
//  Property Manager
//
//  Created by Matthew Knippen on 11/20/13.
//  Copyright (c) 2013 Zwiffer Inc. All rights reserved.
//

#import "Unit.h"
#import <Parse/PFObject+Subclass.h>
#import <QuickDialog/QuickDialog.h>
#import "Building.h"

@implementation Unit

@dynamic name, building, tenant, sort, vacant, squareFeet, bathrooms, bedrooms, rentPrice, deposit, moveInDate, leaseStartDate, leaseEndDate, notes;

+ (NSString *)parseClassName {
    return @"Unit";
}

+ (QRootElement *)rootElement {
    QRootElement *root = [[QRootElement alloc] init];
    root.title = @"New Unit";
    root.grouped = YES;
    QSection *section = [[QSection alloc] init];
    section.title = @"Unit Information";
    QEntryElement *nameEntry = [[QEntryElement alloc] initWithTitle:@"Unit Name:             " Value:nil Placeholder:@"Name"];
    nameEntry.bind = @"textValue:name";
    [section addElement:nameEntry];

    QBooleanElement *vacantEntry = [[QBooleanElement alloc] initWithTitle:@"Vacant: " BoolValue:NO];
    vacantEntry.bind = @"boolValue:vacant";
    [section addElement:vacantEntry];

    QDecimalElement *squareFeetEntry = [[QDecimalElement alloc] initWithTitle:@"Square Feet: " value:@(100)];
    squareFeetEntry.bind = @"numberValue:squareFeet";
    [section addElement:squareFeetEntry];

    QDecimalElement *bedroomsEntry = [[QDecimalElement alloc] initWithTitle:@"Bedrooms: " value:@(0)];
    bedroomsEntry.bind = @"numberValue:bedrooms";
    [section addElement:bedroomsEntry];

    QDecimalElement *bathroomsEntry = [[QDecimalElement alloc] initWithTitle:@"Bathrooms: " value:@(0)];
    bathroomsEntry.bind = @"numberValue:bathrooms";
    [section addElement:bathroomsEntry];

    [root addSection:section];

    QSection *section2 = [[QSection alloc] init];
    section2.title = @"Money Information";

    QDecimalElement *priceEntry = [[QDecimalElement alloc] initWithTitle:@"Rent Price:        $" value:@(100)];
    priceEntry.bind = @"numberValue:rentPrice";
    [section2 addElement:priceEntry];

    QDecimalElement *depositEntry = [[QDecimalElement alloc] initWithTitle:@"Deposit Price:   $" value:@(100)];
    depositEntry.bind = @"numberValue:deposit";
    [section2 addElement:depositEntry];
    [root addSection:section2];

    QSection *section3 = [[QSection alloc] init];
    section3.title = @"Dates";

    QDateTimeElement *moveInDateEntry = [[QDateTimeElement alloc] initWithTitle:@"Move In Date:" date:[NSDate date]];
    moveInDateEntry.bind = @"dateValue:moveInDate";
    moveInDateEntry.mode = UIDatePickerModeDate;
    [section3 addElement:moveInDateEntry];

    QDateTimeElement *leaseStartDateEntry = [[QDateTimeElement alloc] initWithTitle:@"Lease Start Date:" date:[NSDate date]];
    leaseStartDateEntry.bind = @"dateValue:leaseStartDate";
    leaseStartDateEntry.mode = UIDatePickerModeDate;
    [section3 addElement:leaseStartDateEntry];

    QDateTimeElement *leaseEndDateEntry = [[QDateTimeElement alloc] initWithTitle:@"Lease End Date:" date:[[NSDate date] dateByAddingTimeInterval:86400*365]];
    leaseEndDateEntry.bind = @"dateValue:leaseEndDate";
    leaseEndDateEntry.mode = UIDatePickerModeDate;
    [section3 addElement:leaseEndDateEntry];
    [root addSection:section3];

    QSection *section4 = [[QSection alloc] init];
    section4.title = @"Other";

    QEntryElement *notesEntry = [[QEntryElement alloc] initWithTitle:@"Notes:     " Value:nil Placeholder:@"Notes"];
    notesEntry.bind = @"textValue:notes";
    [section4 addElement:notesEntry];
    [root addSection:section4];
    
    return root;
}


@end
