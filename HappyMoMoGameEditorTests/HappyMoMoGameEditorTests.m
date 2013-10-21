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
    
    NSMutableArray* missions = [NSMutableArray array];
    
    for (int i = 0; i < 5; i++) {
        NSArray* facials = @[[NSNumber numberWithInt:i + 1]];
        self.mission = [[WZWMission alloc] initWithScore:2
                                              timeLimite:3.0f
                                                 facials:facials
                                                sequence:NO
                                              totalCount:1
                                             obstruction:nil
                                               titleFile:@"sampleImg.png"
                                               barEncode:0];
        self.mission.obstructions = @[@0];
        [missions addObject:self.mission];
    }
    [missions[0] setTitleImgName:@"touch the left ear"];
    [missions[1] setTitleImgName:@"touch the right ear"];
    [missions[2] setTitleImgName:@"touch the left eye"];
    [missions[3] setTitleImgName:@"touch the right eye"];
    [missions[4] setTitleImgName:@"touch the nose"];
    
    gameData.totalScores = @[@0.f, @0.6f, @0.8f, @0.95f];
    gameData.goldRatios = @[@0.f, @0.3f, @0.6f, @1.2f];
    gameData.scoreLevelCount = 4;
    gameData.missions = missions;
    gameData.missionHelps = @[@0, @1, @2];
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
