//
//  testXMLParser.m
//  XMLParserTest_5
//
//  Created by 华仔 on 14-6-3.
//  Copyright (c) 2014年 litterDeveloper. All rights reserved.
//

#import "testXMLParser.h"

@implementation testXMLParser
{
    NSMutableString *newString;
}
@synthesize tests;
@synthesize entry;
@synthesize targets;
@synthesize isUseful;

static NSString *name = @"sName";
static NSString *number = @"sNumber";

-(void)start {
    
    self.delegate = self;
    
    targets = [NSArray arrayWithObjects:name, number, nil];
    newString = [NSMutableString string];
     tests = [[NSMutableArray alloc] init];
    
    [self parse];
}

#pragma mark -- NSXMLParser - Method

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    
    if ([elementName isEqualToString:@"test_1"])
    {
        entry = [[test alloc] init];
    }
    
    isUseful = [targets containsObject:elementName];
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    
    if (isUseful)
    {
        NSRange range = [string rangeOfString:@""];
        
        //来防止</>也读取,会出现很多空格
        if (!(range.length == 1 && range.location == 1))
        {
            [newString appendString:string];
        }
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qName {
    
    if (isUseful && entry) {
        NSString *str = [newString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        
        [newString setString:@""];
        
        if ([elementName isEqualToString:@"sNumber"])
        {
            entry.number = str;
        }
        else if ([elementName isEqualToString:@"sName"])
        {
            entry.name = str;
        }
    }
    
    if ([elementName isEqualToString:@"test_1"])
    {
        [tests addObject:entry];
        entry = nil;
    }
    
}

@end
