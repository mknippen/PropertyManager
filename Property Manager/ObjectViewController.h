//
//  ObjectViewController.h
//  Property Manager
//
//  Created by Matthew Knippen on 11/20/13.
//  Copyright (c) 2013 Zwiffer Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Building;

@interface ObjectViewController : PFQueryTableViewController

@property (nonatomic, strong) NSString *objectType; //Building, Unit or Tenant
@property (nonatomic, strong) Building *parentObject; 

+ (ObjectViewController *)newFromStoryboard;

@end
