//
//  CSVResultsTableViewCell.h
//  CSVImporter
//
//  Created by Mohammed Safwat on 11/19/14.
//  Copyright (c) 2014 Boximize. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CSVResultsTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *itemTitle;
@property (nonatomic, strong) NSMutableArray *cellData;
@property (nonatomic, strong) NSMutableArray *cellHeaderData;
@end
