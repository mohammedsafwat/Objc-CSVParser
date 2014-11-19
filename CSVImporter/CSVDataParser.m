//
//  CSVDataParser.m
//  CSVImporter
//
//  Created by Mohammed Safwat on 11/19/14.
//  Copyright (c) 2014 Boximize. All rights reserved.
//

#import "CSVDataParser.h"

@interface CSVDataParser()
@property(nonatomic, weak) NSString *filePath;
@property(nonatomic, weak) NSString *fileContents;

@end

@implementation CSVDataParser

- (void)parseCSVFile {
    [self.csvDataParserDelegate startActivityIndicator:self];
    self.filePath = [[NSBundle mainBundle]pathForResource:@"contacts" ofType:@"csv"];
    self.fileContents = [NSString stringWithContentsOfFile:self.filePath encoding:NSUTF8StringEncoding error:nil];
    
    if(!self.fileContents) {
        NSLog(@"Error reading CSV file!");
        [self displayAlertView:@"Error" alertViewMessage:@"There was an error loading the CSV file!" cancelButtonTitle:@"OK"];
    }
    
    NSArray *fileLinesArray = [[NSArray alloc]init];
    fileLinesArray = [self.fileContents componentsSeparatedByString:@"\n"];
    
    self.csvHeaderComponents = [[NSMutableArray alloc]init];
    self.csvLinesMappings = [[NSMutableDictionary alloc]init];
    for(NSString* line in fileLinesArray) {
        NSArray *lineFields = [[NSArray alloc]init];
        lineFields = [line componentsSeparatedByString:@","];
        NSMutableArray* fields = [[NSMutableArray alloc]init];
        for(NSString* field in lineFields) {
            //Check if this is the header of the CSV file
            if([fileLinesArray indexOfObject:line] == 0)
            {
                [self.csvHeaderComponents addObject:field];
            }
            else
            {
                NSString* itemKey = [NSString stringWithFormat:@"Item%d", [fileLinesArray indexOfObject:line]];
                [fields addObject:field];
                [self.csvLinesMappings setObject:fields forKey:itemKey];
            }
        }
        if([fileLinesArray indexOfObject:line] == fileLinesArray.count - 1)
        {
            [self.csvDataParserDelegate stopActivityIndicator:self];
            [self.csvDataParserDelegate parsedFileHeadersArray:self];
            [self.csvDataParserDelegate parsedFileLinesMappings:self];
        }
    }
}

- (void)displayAlertView:(NSString*) alertViewTitle alertViewMessage:(NSString*)alertViewMessage cancelButtonTitle:(NSString*)cancelButtonTitle{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:alertViewTitle message:alertViewMessage delegate:nil cancelButtonTitle:cancelButtonTitle otherButtonTitles:nil];
    [alertView show];
}
@end
