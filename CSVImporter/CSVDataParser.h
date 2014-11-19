//
//  CSVDataParser.h
//  CSVImporter
//
//  Created by Mohammed Safwat on 11/19/14.
//  Copyright (c) 2014 Boximize. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CSVDataParser;

@protocol CSVDataParserDelegate
- (void)reloadTableViewData:(CSVDataParser*)csvDataParser;
- (void)startActivityIndicator:(CSVDataParser*)csvDataParser;
- (void)stopActivityIndicator:(CSVDataParser*)csvDataParser;
- (NSMutableArray*)parsedFileHeadersArray:(CSVDataParser*)csvDataParser;
- (NSMutableDictionary*)parsedFileLinesMappings:(CSVDataParser*)csvDataParser;
@end

@interface CSVDataParser : NSObject
@property (nonatomic, weak) id csvDataParserDelegate;
@property(nonatomic, strong) NSMutableArray *csvHeaderComponents;
@property(nonatomic, strong) NSMutableDictionary *csvLinesMappings;
- (void)parseCSVFile;
@end
