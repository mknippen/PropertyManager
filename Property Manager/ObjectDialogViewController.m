//
//  ObjectDialogViewController.m
//  Property Manager
//
//  Created by Matthew Knippen on 11/20/13.
//  Copyright (c) 2013 Zwiffer Inc. All rights reserved.
//

#import "ObjectDialogViewController.h"
#import "Building.h"
#import "Unit.h"
#import "Tenant.h"

@interface ObjectDialogViewController ()

@end

@implementation ObjectDialogViewController

- (QuickDialogController *)initWithRoot:(QRootElement *)rootElement {
    self = [super initWithRoot:rootElement];
    if (self) {
        
    }

    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneButtonPressed)];
    self.navigationItem.rightBarButtonItem = doneButton;	// Do any additional setup after loading the view.
}

- (void)doneButtonPressed {
    Class objectClass = NSClassFromString(self.objectType);
    Building *b = [objectClass object];     //not always a building
    [self.root fetchValueUsingBindingsIntoObject:b];

    if ([self.objectType isEqualToString:@"Unit"]) {
        ((Unit *)b).building = (Building *)self.parentObject;
        [b saveInBackground];

    } else if ([self.objectType isEqualToString:@"Building"]) {
        if (b.unitCount > 1) {
            NSMutableArray *units = [[NSMutableArray alloc] initWithCapacity:b.unitCount];
            for (int i=0; i<b.unitCount; i++) {
                Unit *u = [Unit object];
                u.building = b;
                u.sort = i;
                u.name = [NSString stringWithFormat:@"Unit %i", i+1];
                [units addObject:u];
            }
            [b saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                if (succeeded) {
                    [PFObject saveAllInBackground:units];
                }

                [self.navigationController popViewControllerAnimated:YES];
            }];
        }
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
