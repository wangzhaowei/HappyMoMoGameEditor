//
//  WZWMission.m
//  HappyMoMoGameEditor
//
//  Created by FlameMare on 13-10-12.
//  Copyright (c) 2013年 王 昭威. All rights reserved.
//

#import "WZWMission.h"
#import <objc/runtime.h>
#import "NSNumber+WZWXMLEncode.h"
#import "NSString+WZWXMLEncode.h"

@implementation WZWMission

- (id)init
{
    if (self = [super init]) {
        _score = 0.f;
        _timeLimite = 0.f;
        _facials = nil;
        _sequence = NO;
        _totalCount = 0;
        _obstructions = nil;
        _titleImgName = nil;
        _barEncode = 0u;
        
        self.rootKey = @"_mission";
    }
    
    return self;
}

- (id)initWithScore:(float)score timeLimite:(float)timeLimite facials:(NSArray *)facials sequence:(BOOL)sequence totalCount:(int)totalCount obstruction:(NSArray *)obstruction titleFile:(NSString *)titleFileName barEncode:(NSUInteger)barEncode
{
    self = [super init];
    if (self != nil) {
        _score = score;
        _timeLimite = timeLimite;
        _facials = facials;
        _sequence = sequence;
        _totalCount = totalCount;
        _obstructions = [obstruction copy];
        _titleImgName = titleFileName;
        _barEncode = barEncode;
        
        self.rootKey = @"_mission";
    }
    return self;
}

- (NSXMLElement*)elemValueWithElemKey:(NSString *)elemKey
{
    if ([elemKey isEqualToString:@"_obstructions"]) {
        return [self encodeArrayToXMLElement:self.obstructions
                                     rootKey:elemKey
                                  elementKey:[elemKey substringToIndex:elemKey.length - 1]];
    }
    NSXMLElement* elem = nil;
    id var = [self valueForKey:elemKey];
    if (![var conformsToProtocol:@protocol(WZWXMLChainEncodeDelegate)]) {
        if ([elemKey isEqualToString:@"_barEncode"]) {
            elem = [NSXMLElement elementWithName:elemKey];
            [elem setObjectValue:[var stringValue]];
        }
        else{
            if ([elemKey isEqualToString:@"_facials"]) {
                elem = [self encodeArrayToXMLElement:self.facials
                                             rootKey:elemKey
                                          elementKey:@"_facial"];
            }
            else{
                elem = [super elemValueWithElemKey:elemKey];
            }
        }
    }
    else{
        if ([var respondsToSelector:@selector(createXMLElement)]) {
            elem = [var createXMLElement];
        }
        else{
            elem = [var createXMLElementWithKey:elemKey];
        }
    }
    
    if (elem == nil) {
        @throw WZW_EXCEPTION_NOT_XML_CHAIN_PROTOCOL;
    }
    
    return elem;
}

@end
