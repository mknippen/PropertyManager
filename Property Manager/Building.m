//
//  Building.m
//  Property Manager
//
//  Created by Matthew Knippen on 11/20/13.
//  Copyright (c) 2013 Zwiffer Inc. All rights reserved.
//

#import "Building.h"
#import <Parse/PFObject+Subclass.h>
#import <QuickDialog/QuickDialog.h>

@implementation Building

@dynamic name, address, town, state, zipCode, units, notes, unitCount;

+ (NSString *)parseClassName {
    return @"Building";
}

+ (QRootElement *)rootElement {
    QRootElement *root = [[QRootElement alloc] init];
    root.title = @"New Building";
    root.grouped = YES;
    QSection *section = [[QSection alloc] init];
    section.title = @"Location Information";
    QEntryElement *nameEntry = [[QEntryElement alloc] initWithTitle:@"Building Name:             " Value:nil Placeholder:@"Name"];
    nameEntry.bind = @"textValue:name";
    [section addElement:nameEntry];

    QEntryElement *addressEntry = [[QEntryElement alloc] initWithTitle:@"Street Address:" Value:nil Placeholder:@"Address"];
    addressEntry.bind = @"textValue:address";
    [section addElement:addressEntry];

    QEntryElement *townEntry = [[QEntryElement alloc] initWithTitle:@"Town:" Value:nil Placeholder:@"Chicago"];
    townEntry.bind = @"textValue:town";
    [section addElement:townEntry];

    QEntryElement *stateEntry = [[QEntryElement alloc] initWithTitle:@"State:" Value:nil Placeholder:@"IL"];
    stateEntry.bind = @"textValue:state";
    [section addElement:stateEntry];

    QEntryElement *zipCodeEntry = [[QEntryElement alloc] initWithTitle:@"ZIP Code:" Value:nil Placeholder:@"60607"];
    zipCodeEntry.keyboardType = UIKeyboardTypeNumberPad;
    zipCodeEntry.bind = @"textValue:zip";
    [section addElement:zipCodeEntry];

    [root addSection:section];

    QSection *section2 = [[QSection alloc] init];
    section2.title = @"Building Information";

    QDecimalElement *unitsEntry = [[QDecimalElement alloc] initWithTitle:@"Number of Units:        " value:@(1)];
    unitsEntry.bind = @"numberValue:unitCount";
    [section2 addElement:unitsEntry];

    QEntryElement *notesEntry = [[QEntryElement alloc] initWithTitle:@"Notes:" Value:nil Placeholder:@"Notes"];
    notesEntry.bind = @"textValue:notes";
    [section2 addElement:notesEntry];
    [root addSection:section2];

    return root;
}


@end
