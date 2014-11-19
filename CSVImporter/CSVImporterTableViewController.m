//
//  CSVImporterTableViewController.m
//  CSVImporter
//
//  Created by Mohammed Safwat on 11/19/14.
//  Copyright (c) 2014 Boximize. All rights reserved.
//

#import "CSVImporterTableViewController.h"
#import "BKECircularProgressView.h"
#import "CSVResultsTableViewCell.h"
#import "CSVDataParser.h"
#import "CSVDetailedResultViewController.h"

#define CSVDetailedResultSegueueIdentifier @"CSVDetailedResultSegueue"
@interface CSVImporterTableViewController ()
@property(nonatomic, strong) NSMutableArray *parsedFileHeadersArray;
@property(nonatomic, strong) NSMutableDictionary *parsedFileLinesMappings;
@property (nonatomic, strong) BKECircularProgressView *progressView;
@property (nonatomic, strong) CSVDataParser *csvDataParser;
@end

@implementation CSVImporterTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self.tableView registerNib:[UINib nibWithNibName:@"CSVResultsTableCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"CSVResultsTableCell"];
    
    self.parsedFileHeadersArray = [[NSMutableArray alloc]init];
    self.parsedFileLinesMappings = [[NSMutableDictionary alloc]init];
    self.progressView = [[BKECircularProgressView alloc]init];
    self.progressView.frame = CGRectMake(self.view.center.x - 25, self.view.center.y, 50, 50);
    [self.progressView setProgressTintColor:[UIColor colorWithRed:51.0/255.0 green:139.0/255.0 blue:202.0/255.0 alpha:1.0]];
    [self.progressView setBackgroundTintColor:[UIColor colorWithRed:223.0/255.0 green:223.0/255.0 blue:223.0/255.0 alpha:1]];
    [self.progressView setLineWidth:3.0f];
    [self.view addSubview:self.progressView];
    
    self.csvDataParser = [[CSVDataParser alloc]init];
    self.csvDataParser.csvDataParserDelegate = self;
    
    [self.csvDataParser parseCSVFile];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSMutableArray*)parsedFileHeadersArray:(CSVDataParser *)csvDataParser
{
    self.parsedFileHeadersArray = csvDataParser.csvHeaderComponents;
    return self.parsedFileHeadersArray;
}

- (NSMutableDictionary*)parsedFileLinesMappings:(CSVDataParser *)csvDataParser
{
    self.parsedFileLinesMappings = csvDataParser.csvLinesMappings;
    return self.parsedFileLinesMappings;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return self.parsedFileLinesMappings.count;
}

- (void)startActivityIndicator:(CSVDataParser *)csvDataParser
{
    self.progressView.hidden = NO;
    self.progressView.progress = 0.0f;
}

- (void)stopActivityIndicator:(CSVDataParser *)csvDataParser
{
    self.progressView.hidden = YES;
}

- (void)reloadTableViewData:(CSVDataParser *)csvDataParser
{
    [self.tableView reloadData];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CSVResultsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CSVResultsTableCell" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.layer.shouldRasterize = YES;
    cell.layer.rasterizationScale = [UIScreen mainScreen].scale;
    
    NSString* itemKey = [NSString stringWithFormat:@"Item%d", indexPath.row + 1];
    
    NSMutableArray *csvLineFields = [[NSMutableArray alloc]initWithArray:[self.parsedFileLinesMappings objectForKey:itemKey]];
    
    cell.itemTitle.text = [csvLineFields objectAtIndex:0];
    cell.cellData = csvLineFields;
    cell.cellHeaderData = self.parsedFileHeadersArray;
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:CSVDetailedResultSegueueIdentifier sender:[self.tableView cellForRowAtIndexPath:indexPath]];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    CSVDetailedResultViewController *detailedViewController = segue.destinationViewController;
    detailedViewController.tappedCell = sender;
}

@end
