//
//  CSVDetailedResultViewController.m
//  CSVImporter
//
//  Created by Mohammed Safwat on 11/19/14.
//  Copyright (c) 2014 Boximize. All rights reserved.
//

#import "CSVDetailedResultViewController.h"

@interface CSVDetailedResultViewController ()

@end

@implementation CSVDetailedResultViewController

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
    // Do any additional setup after loading the view.
    self.firstHeaderLabel.text = [self.tappedCell.cellHeaderData objectAtIndex:0];
    self.secondHeaderLabel.text = [self.tappedCell.cellHeaderData objectAtIndex:1];
    self.thirdHeaderLabel.text = [self.tappedCell.cellHeaderData objectAtIndex:2];
    self.fourthHeaderLabel.text = [self.tappedCell.cellHeaderData objectAtIndex:3];
    
    self.firstHeaderValueLabel.text = [self.tappedCell.cellData objectAtIndex:0];
    self.secondHeaderValueLabel.text = [self.tappedCell.cellData objectAtIndex:1];
    self.thirdHeaderValueLabel.text = [self.tappedCell.cellData objectAtIndex:2];
    self.fourthHeaderValueLabel.text = [self.tappedCell.cellData objectAtIndex:3];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
