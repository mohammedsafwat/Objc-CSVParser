//
//  CSVImporterTableViewController.h
//  CSVImporter
//
//  Created by Mohammed Safwat on 11/19/14.
//  Copyright (c) 2014 Boximize. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CSVDataParser.h"

@interface CSVImporterTableViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate, CSVDataParserDelegate>

@end
