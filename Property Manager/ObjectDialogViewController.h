//
//  ObjectDialogViewController.h
//  Property Manager
//
//  Created by Matthew Knippen on 11/20/13.
//  Copyright (c) 2013 Zwiffer Inc. All rights reserved.
//

#import "QuickDialogController.h"
#import <QuickDialog/QuickDialog.h>

@interface ObjectDialogViewController : QuickDialogController

@property (nonatomic, strong) NSString *objectType;
@property (nonatomic, strong) PFObject *parentObject;


@end
