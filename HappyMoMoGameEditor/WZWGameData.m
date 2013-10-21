//
//  WZWGameData.m
//  HappyMoMoGameEditor
//
//  Created by FlameMare on 13-10-12.
//  Copyright (c) 2013年 王 昭威. All rights reserved.
//

#import "WZWGameData.h"
#import "NSNumber+WZWXMLEncode.h"

@implementation WZWGameData

- (id)init
{
    self = [super init];
    if (self) {
        _scoreLevelCount = 0;
#ifdef DEBUG
        _scoreLevelCount = 4;
#endif
        _totalScores = nil;
        
        self.rootKey = @"gameData";
    }
    return self;
}

- (NSXMLElement *)elemValueWithElemKey:(NSString *)elemKey
{
    NSXMLElement* elem = nil;
    id var = [self valueForKey:elemKey];
    if ([elemKey isEqualToString:@"_scoreLevelCount"]) {
        if ([var respondsToSelector:@selector(createXMLElement)]) {
            elem = [var createXMLElement];
        }
        else{
            elem = [var createXMLElementWithKey:@"_scoreLevelCount"];
        }
    }
    else{
        //  舍弃字符串最后的s
        NSString* subElemKey = [elemKey substringWithRange:NSMakeRange(0, elemKey.length - 1)];
        @try {
            elem = [self encodeArrayToXMLElement:var
                                         rootKey:elemKey
                                      elementKey:subElemKey];
        }
        @catch (NSException *exception) {
            elem = [super elemValueWithElemKey:elemKey];
        }
        @finally {
            if (elem == nil) {
                @throw WZW_EXCEPTION_NOT_XML_CHAIN_PROTOCOL;
            }
        }
    }
    
    return elem;
}

@end
