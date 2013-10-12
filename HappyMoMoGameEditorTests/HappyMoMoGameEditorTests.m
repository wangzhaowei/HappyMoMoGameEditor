//
//  HappyMoMoGameEditorTests.m
//  HappyMoMoGameEditorTests
//
//  Created by FlameMare on 13-10-12.
//  Copyright (c) 2013年 王 昭威. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "WZWMission.h"
#import "WZWGameData.h"

@interface HappyMoMoGameEditorTests : XCTestCase

@property (strong) WZWMission* mission;
@property (strong) WZWGameData* gameData;

@end

@implementation HappyMoMoGameEditorTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    WZWGameData* gameData = [[WZWGameData alloc] init];
    
    NSMutableArray* missions = [NSMutableArray arrayWithCapacity:3u];
    
    for (int i = 0; i < 3; i++) {
        NSArray* facials = [NSArray arrayWithObject:[NSNumber numberWithInt:i + 1]];
        self.mission = [[WZWMission alloc] initWithScore:i + 1
                                              timeLimite:3.0f
                                                 facials:facials
                                                sequence:NO
                                              totalCount:1
                                             obstruction:nil
                                               titleFile:@"sampleImg.png"
                                               barEncode:0];
        [missions addObject:self.mission];
    }
    
    gameData.totalScore[0] = 0.6f;
    gameData.totalScore[1] = 0.8f;
    gameData.totalScore[2] = 0.95f;
    gameData.missions = missions;
    self.gameData = gameData;
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)writeXMLDocWithRootElem:(NSXMLElement*)root fileName:(NSString*)fn
{
    NSXMLDocument* xmlDoc = [[NSXMLDocument alloc] initWithRootElement:root];
    [xmlDoc setCharacterEncoding:@"UTF-8"];
    [xmlDoc setVersion:@"1.0"];
    NSData *xmlData = [xmlDoc XMLDataWithOptions:NSXMLNodePrettyPrint];
    [xmlData writeToFile:[NSHomeDirectory() stringByAppendingPathComponent:fn] atomically:YES];
}

- (void)testMissionXML
{
    NSXMLElement* elem = [self.mission createXMLElement];
    if (elem == nil) {
        XCTFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);
    }
    [self writeXMLDocWithRootElem:elem fileName:@"mission.xml"];
}

- (void)testGameXML
{
    NSXMLElement* elem = [self.gameData createXMLElement];
    if (elem == nil) {
        XCTFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);
    }
    
    [self writeXMLDocWithRootElem:elem fileName:@"game.xml"];
}

- (void)testExample
{
//    XCTFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);
}

@end
