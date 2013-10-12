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
    gameData.missions = nil;
    
    NSMutableArray* missions = [NSMutableArray arrayWithCapacity:3u];
    NSArray* facials = [NSArray arrayWithObjects:@1, @2, @3, nil];
    
    for (int i = 0; i < 3; i++) {
    self.mission = [[WZWMission alloc] initWithScore:0.5f
                                          timeLimite:3.0f
                                             facials:facials
                                            sequence:NO
                                          totalCount:3
                                         obstruction:nil
                                           titleFile:@"sampleImg.png"
                                           barEncode:0];
    [missions addObject:self.mission];
    }
    
    gameData.missions = missions;
    self.gameData = gameData;
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testMissionXML
{
    NSXMLElement* elem = [self.gameData createXMLElement];
    if (elem == nil) {
        XCTFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);
    }
    
    NSXMLDocument* xmlDoc = [[NSXMLDocument alloc] initWithRootElement:elem];
    [xmlDoc setCharacterEncoding:@"UTF-8"];
    [xmlDoc setVersion:@"1.0"];
    NSData *xmlData = [xmlDoc XMLDataWithOptions:NSXMLNodePrettyPrint];
    [xmlData writeToFile:[NSHomeDirectory() stringByAppendingString:@"/testMission.xml"] atomically:YES];
}

- (void)testExample
{
//    XCTFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);
}

@end
