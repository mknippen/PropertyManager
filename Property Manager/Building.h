//
//  Building.h
//  Property Manager
//
//  Created by Matthew Knippen on 11/20/13.
//  Copyright (c) 2013 Zwiffer Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Unit, QRootElement;

@interface Building : PFObject <PFSubclassing>

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) NSString *town;
@property (nonatomic, strong) NSString *state;
@property (nonatomic, strong) NSString *zipCode;
@property (nonatomic, strong) NSArray *units;
@property (nonatomic, strong) NSString *notes;

+ (NSString *)parseClassName;

+ (QRootElement *)rootElement;

@end
