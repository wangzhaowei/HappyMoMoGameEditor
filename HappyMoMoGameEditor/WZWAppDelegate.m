//
//  WZWAppDelegate.m
//  HappyMoMoGameEditor
//
//  Created by FlameMare on 13-10-12.
//  Copyright (c) 2013年 王 昭威. All rights reserved.
//

#import "WZWAppDelegate.h"
#import "WZWMission.h"

@implementation WZWAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    NSArray* facials = [NSArray arrayWithObjects:@1, @2, @3, nil];
    WZWMission* mission = [[WZWMission alloc] initWithScore:0.5f
                                                 timeLimite:3.0f
                                                    facials:facials
                                                   sequence:NO
                                                 totalCount:3
                                                obstruction:nil
                                                  titleFile:@"sampleImg.png"
                                                  barEncode:0];
    NSXMLElement* elem = [mission createXMLElement];
    NSLog(@"%@", [elem description]);
//    NSXMLElement* elem = [NSXMLNode elementWithName:@"test"];
//    [elem setObjectValue:@"123123"];
//    
//    NSXMLElement* childElem = [NSXMLElement elementWithName:@"subTest"];
//    [childElem setObjectValue:@"child"];
//    [elem addChild:childElem];
//    
//    NSXMLDocument *xmlDoc = [[NSXMLDocument alloc] initWithRootElement:elem];
//    [xmlDoc setVersion:@"1.0"];
//    [xmlDoc setCharacterEncoding:@"UTF-8"];
//    
//    NSData *xmlData = [xmlDoc XMLDataWithOptions:NSXMLNodePrettyPrint];
//    [xmlData writeToFile:[NSHomeDirectory() stringByAppendingString:@"/test.xml"] atomically:YES];
}

@end
