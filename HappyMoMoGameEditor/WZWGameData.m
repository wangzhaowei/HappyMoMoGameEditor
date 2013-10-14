//
//  WZWGameData.m
//  HappyMoMoGameEditor
//
//  Created by FlameMare on 13-10-12.
//  Copyright (c) 2013年 王 昭威. All rights reserved.
//

#import "WZWGameData.h"
#import "NSNumber+WZWXMLEncode.h"

const int totalScoreCount = 3;

@implementation WZWGameData

- (id)init
{
    self = [super init];
    if (self) {
        _scoreLevelCount = 0;
        _totalScores = nil;
        
        self.rootKey = @"gameData";
    }
    return self;
}

- (NSXMLElement *)elemValueWithElemKey:(NSString *)elemKey
{
    NSXMLElement* elem = nil;
    if ([elemKey isEqualToString:@"_missions"] || [elemKey isEqualToString:@"_totalScores"]) {
        //  舍弃字符串最后的s
        NSString* subElemKey = [elemKey substringWithRange:NSMakeRange(0, elemKey.length - 1)];
        @try {
            elem = [self encodeArrayToXMLElement:self.missions
                                      elementKey:subElemKey];
        }
        @catch (NSException *exception) {
            NSLog(@"%@", [exception description]);
            elem = nil;
        }
        @finally {
            elem = nil;
        }
        
        return elem;
    }
    
    if ([elemKey isEqualToString:@"_scoreLevelCount"]) {
        elem = [NSXMLElement elementWithName:elemKey];
        if (elem == nil) {
            @throw [NSException exceptionWithName:@"elem error" reason:@"elem ptr is nil" userInfo:nil];
        }
        NSNumber* scoreLevelCountNumber = [self valueForKey:elemKey];
        if ([scoreLevelCountNumber respondsToSelector:@selector(createXMLElement)]) {
            elem = [scoreLevelCountNumber createXMLElement];
        }
        else{
            elem = [scoreLevelCountNumber createXMLElementWithKey:@"_scoreLevelCount"];
        }
        
        
        return elem;
    }
    
    return [super elemValueWithElemKey:elemKey];
}

@end
