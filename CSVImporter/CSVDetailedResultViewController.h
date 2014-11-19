//
//  CSVDetailedResultViewController.h
//  CSVImporter
//
//  Created by Mohammed Safwat on 11/19/14.
//  Copyright (c) 2014 Boximize. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CSVResultsTableViewCell.h"

@interface CSVDetailedResultViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *firstHeaderLabel;
@property (strong, nonatomic) IBOutlet UILabel *secondHeaderLabel;
@property (strong, nonatomic) IBOutlet UILabel *thirdHeaderLabel;
@property (strong, nonatomic) IBOutlet UILabel *fourthHeaderLabel;
@property (strong, nonatomic) IBOutlet UILabel *firstHeaderValueLabel;
@property (strong, nonatomic) IBOutlet UILabel *secondHeaderValueLabel;
@property (strong, nonatomic) IBOutlet UILabel *thirdHeaderValueLabel;
@property (strong, nonatomic) IBOutlet UILabel *fourthHeaderValueLabel;
@property (nonatomic, weak) CSVResultsTableViewCell *tappedCell;

@end
