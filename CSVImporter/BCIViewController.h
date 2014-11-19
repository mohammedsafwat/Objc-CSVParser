//
//  BCIViewController.h
//  CSVImporter
//
//  Created by Mohammed Safwat on 11/18/14.
//  Copyright (c) 2014 Boximize. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BCIViewController : UIViewController
- (IBAction)normalCSVFileButton:(id)sender;
- (IBAction)csvFileWithMissingFields:(id)sender;
- (IBAction)csvFileWithMissingHeaders:(id)sender;
@end
