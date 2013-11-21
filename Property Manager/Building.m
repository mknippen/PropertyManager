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

@dynamic name, address, town, state, zipCode, units, notes;

+ (NSString *)parseClassName {
    return @"Building";
}

+ (QRootElement *)rootElement {
    QRootElement *root = [[QRootElement alloc] init];
    root.title = @"Hello World";
    root.grouped = YES;
    QSection *section = [[QSection alloc] init];
    QLabelElement *label = [[QLabelElement alloc] initWithTitle:@"Hello" Value:@"world!"];

    [root addSection:section];
    [section addElement:label];

    return root;
}


@end
