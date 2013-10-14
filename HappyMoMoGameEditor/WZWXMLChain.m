//
//  WZWXMLChain.m
//  HappyMoMoGameEditor
//
//  Created by FlameMare on 13-10-12.
//  Copyright (c) 2013年 王 昭威. All rights reserved.
//

#import "WZWXMLChain.h"

@implementation WZWXMLChain

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

- (NSXMLElement*)elemValueWithElemKey:(NSString *)elemKey
{
    id var = [self valueForKey:elemKey];
    NSXMLElement* elem = nil;
    if ([var conformsToProtocol:@protocol(WZWXMLChainEncodeDelegate)]) {
        if ([var respondsToSelector:@selector(createXMLElement)]) {
            elem = [var createXMLElement];
        }
        else{
            elem = [var createXMLElementWithKey:elemKey];
        }
    }
    else{
        @throw [NSException exceptionWithName:@"object protocol error" reason:@"object isn't a WZWXMLChainEncodeDelegate or subclass" userInfo:nil];
    }
    
    return elem;
}

- (NSXMLElement *)encodeArrayToXMLElement:(NSArray *)srcArray elementKey:(NSString *)elemKey
{
    NSXMLElement* subroot = [NSXMLElement elementWithName:elemKey];
    if (subroot == nil) {
        @throw [NSException exceptionWithName:@"subroot error" reason:@"subroot is nil" userInfo:nil];
    }
    
    [srcArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if (![obj conformsToProtocol:@protocol(WZWXMLChainEncodeDelegate)]) {
            @throw [NSException exceptionWithName:@"array element protocol error"
                                           reason:[NSString stringWithFormat:@"%lu element not a WZWXMLChainEncodeDelegate or subclass", idx]
                                         userInfo:nil];
        }
        if ([obj respondsToSelector:@selector(createXMLElement)]) {
            [subroot addChild:[obj createXMLElement]];
        }
        else {
            [subroot addChild:[obj createXMLElementWithKey:elemKey]];
        }
    }];
    
    return subroot;
}

#pragma mark - WZWXMLChainEncodeDelegate
- (NSXMLElement *)createXMLElement{
    return [self createXMLElementWithKey:self.rootKey];
}

- (NSXMLElement *)createXMLElementWithKey:(NSString *)elemKey{
    unsigned int outCount = 0;
    Ivar* instanceVar = class_copyIvarList(self.class, &outCount);
    
    if (elemKey == nil) {
        @throw [NSException exceptionWithName:@"elemKey key error" reason:@"elemKey key is nil" userInfo:nil];
    }

    NSXMLElement* root = [NSXMLElement elementWithName:elemKey];
    root = [self createXMLElementWithIvarList:instanceVar
                                    ivarCount:outCount
                                  rootElement:root];
    
    free(instanceVar);
    return root;
}

@end
