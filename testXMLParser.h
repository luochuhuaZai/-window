//
//  testXMLParser.h
//  XMLParserTest_5
//
//  Created by 华仔 on 14-6-3.
//  Copyright (c) 2014年 litterDeveloper. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "test.h"

@interface testXMLParser : NSXMLParser <NSXMLParserDelegate>

@property (nonatomic, strong) NSMutableArray *tests;
@property (nonatomic, strong) test *entry;
@property (nonatomic, strong) NSArray *targets;
@property BOOL isUseful;

- (void)start;

@end
