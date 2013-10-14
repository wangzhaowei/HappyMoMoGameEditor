//
//  NSNumber+WZWXMLEncode.m
//  HappyMoMoGameEditor
//
//  Created by FlameMare on 13-10-14.
//  Copyright (c) 2013年 王 昭威. All rights reserved.
//

#import "NSNumber+WZWXMLEncode.h"

@implementation NSNumber (WZWXMLEncode)

- (NSXMLElement *)createXMLElementWithKey:(NSString *)elemKey
{
    NSXMLElement* element = [NSXMLElement elementWithName:elemKey];
    [element setObjectValue:[self stringValue]];
    return element;
}

@end
