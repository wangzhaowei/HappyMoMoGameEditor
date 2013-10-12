//
//  WZWGameData.m
//  HappyMoMoGameEditor
//
//  Created by FlameMare on 13-10-12.
//  Copyright (c) 2013年 王 昭威. All rights reserved.
//

#import "WZWGameData.h"

@implementation WZWGameData

- (id)init
{
    self = [super init];
    if (self) {
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
    
    return [super elemValueWithElemKey:elemKey];
}

@end
