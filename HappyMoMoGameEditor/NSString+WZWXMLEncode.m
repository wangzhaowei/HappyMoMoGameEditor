//
//  NSString+WZWXMLEncode.m
//  HappyMoMoGameEditor
//
//  Created by FlameMare on 13-10-14.
//  Copyright (c) 2013年 王 昭威. All rights reserved.
//

#import "NSString+WZWXMLEncode.h"

@implementation NSString (WZWXMLEncode)

- (NSXMLElement *)createXMLElementWithKey:(NSString *)elemKey
{
    NSXMLElement* element = [NSXMLElement elementWithName:elemKey];
    [element setObjectValue:self];
    return element;
}

@end
