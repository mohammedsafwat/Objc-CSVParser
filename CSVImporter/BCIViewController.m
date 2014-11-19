//
//  BCIViewController.m
//  CSVImporter
//
//  Created by Mohammed Safwat on 11/18/14.
//  Copyright (c) 2014 Boximize. All rights reserved.
//

#import "BCIViewController.h"
#define CSVResultsSegueIdentifier @"CSVResultsSegue"

@interface BCIViewController ()

@end

@implementation BCIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)normalCSVFileButton:(id)sender {
    [self performSegueWithIdentifier:CSVResultsSegueIdentifier sender:self];
}

- (IBAction)csvFileWithMissingFields:(id)sender {
}

- (IBAction)csvFileWithMissingHeaders:(id)sender {
}
@end
