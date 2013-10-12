//
//  WZWXMLChain.m
//  HappyMoMoGameEditor
//
//  Created by FlameMare on 13-10-12.
//  Copyright (c) 2013年 王 昭威. All rights reserved.
//

#import "WZWXMLChain.h"

@implementation WZWXMLChain

- (NSXMLElement *)createXMLElement{
    unsigned int outCount = 0;
    Ivar* instanceVar = class_copyIvarList(self.class, &outCount);

    NSString* rootKey = nil;
    if (self.rootKey != nil) {
        rootKey = self.rootKey;
    }
    else{
        @throw [NSException exceptionWithName:@"root key error" reason:@"root key is nil" userInfo:nil];
    }
    NSXMLElement* root = [NSXMLElement elementWithName:rootKey];
    return [self createXMLElementWithIvarList:instanceVar
                                    ivarCount:outCount
                                  rootElement:root];
}

- (id)elemValueWithElemKey:(NSString *)elemKey
{
    id var = [self valueForKey:elemKey];
    NSXMLElement* elem = nil;
    if ([var isKindOfClass:[WZWXMLChain class]]) {
        elem = [var createXMLElement];
    }
    else{
        elem = [NSXMLElement elementWithName:elemKey];
        [elem setObjectValue:[NSString stringWithFormat:@"%@", var]];
    }
    
    return elem;
}

- (NSXMLElement *)createXMLElementWithIvarList:(Ivar *)iVars ivarCount:(NSUInteger)IvarCount rootElement:(NSXMLElement *)rootElem
{
    if (rootElem == nil) {
        @throw [NSException exceptionWithName:@"root elem error" reason:@"root elem is nil" userInfo:nil];
    }
    
    for (int i = 0; i < IvarCount; i++) {
        NSString* elemKey = [NSString stringWithFormat:@"%s", ivar_getName(iVars[i])];
        if (elemKey == nil || [elemKey isEqualToString:@""]) {
            @throw [NSException exceptionWithName:@"elem key error" reason:@"elem key is nil" userInfo:nil];
        }
        
        [rootElem addChild:[self elemValueWithElemKey:elemKey]];
    }
    
    return rootElem;
}

@end
