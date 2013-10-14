//
//  WZWMission.m
//  HappyMoMoGameEditor
//
//  Created by FlameMare on 13-10-12.
//  Copyright (c) 2013年 王 昭威. All rights reserved.
//

#import "WZWMission.h"
#import <objc/runtime.h>

@implementation WZWMission

- (id)initWithScore:(float)score timeLimite:(float)timeLimite facials:(NSArray *)facials sequence:(BOOL)sequence totalCount:(int)totalCount obstruction:(NSArray *)obstruction titleFile:(NSString *)titleFileName barEncode:(NSUInteger)barEncode
{
    self = [super init];
    if (self != nil) {
        _score = score;
        _timeLimite = timeLimite;
        _facials = facials;
        _sequence = sequence;
        _totalCount = totalCount;
        _obstruction = [obstruction copy];
        _titleImgName = titleFileName;
        _barEncode = barEncode;
        
        self.rootKey = @"mission";
    }
    return self;
}

- (NSXMLElement*)elemValueWithElemKey:(NSString *)elemKey
{
    NSXMLElement* elem = nil;
    id var = [self valueForKey:elemKey];
    if ([elemKey isEqualToString:@"_barEncode"]) {
        elem = [NSXMLElement elementWithName:elemKey];
        [elem setObjectValue:[var stringValue]];
    }
    else{
        if ([elemKey isEqualToString:@"_facials"]) {
            NSMutableString* facialsStr = [NSMutableString string];
            [var enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                [facialsStr appendFormat:@"%@,", [obj stringValue]];
            }];
            //  去掉末尾多余的逗号
            NSString* resultStr = [facialsStr substringWithRange:NSMakeRange(0, facialsStr.length - 1)];
            
            elem = [NSXMLElement elementWithName:elemKey];
            [elem setObjectValue:resultStr];
        }
        else{
            elem = [super elemValueWithElemKey:elemKey];
        }
    }
    
    return elem;
}

@end
