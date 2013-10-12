//
//  WZWGameData.m
//  HappyMoMoGameEditor
//
//  Created by FlameMare on 13-10-12.
//  Copyright (c) 2013年 王 昭威. All rights reserved.
//

#import "WZWGameData.h"

const int totalScoreCount = 3;

@implementation WZWGameData

- (id)init
{
    self = [super init];
    if (self) {
        _totalScore = (float*)malloc(sizeof(float) * 3);
        if (_totalScore == nil) {
            return nil;
        }
        for (int i = 0; i < totalScoreCount; i++) {
            _totalScore[i] = 0.f;
        }
        
        self.rootKey = @"gameData";
    }
    return self;
}

- (NSXMLElement *)elemValueWithElemKey:(NSString *)elemKey
{
    if ([elemKey isEqualToString:@"_missions"]) {
        NSXMLElement* subroot = [NSXMLElement elementWithName:elemKey];
        if (subroot == nil) {
            @throw [NSException exceptionWithName:@"subroot error" reason:@"subroot is nil" userInfo:nil];
        }
        
        [self.missions enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            if ([obj isKindOfClass:[WZWXMLChain class]]) {
                [subroot addChild:[obj createXMLElement]];
            }
        }];
        
        return subroot;
    }
    
    if ([elemKey isEqualToString:@"_totalScore"]) {
        NSMutableString* totalScoreStr = [NSMutableString string];
        for (int i = 0; i < totalScoreCount; i++) {
            [totalScoreStr appendFormat:@"%f,", self.totalScore[i]];
        }
        NSString* resultStr = [totalScoreStr substringWithRange:NSMakeRange(0, totalScoreStr.length - 1)];
        NSXMLElement* elem = [NSXMLElement elementWithName:elemKey];
        [elem setObjectValue:resultStr];
        
        return elem;
    }
    
    return [super elemValueWithElemKey:elemKey];
}

- (void)dealloc
{
    free(_totalScore);
    _totalScore = NULL;
}

@end
