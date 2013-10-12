//
//  WZWXMLChain.h
//  HappyMoMoGameEditor
//
//  Created by FlameMare on 13-10-12.
//  Copyright (c) 2013年 王 昭威. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface WZWXMLChain : NSObject

@property (strong) NSString* rootKey;

- (NSXMLElement *)createXMLElement;

//  策略模式，可以在子类中重载这个方法，修改xml文件格式
- (NSXMLElement *)createXMLElementWithIvarList:(Ivar*)iVars ivarCount:(NSUInteger)IvarCount rootElement:(NSXMLElement*)rootElem;

//  这个方法返回对象的key的value, 一般情况下返回NSString
//  当对象是WZWXMLChain时, 返回的是NSXMLElement
- (id)elemValueWithElemKey:(NSString*)elemKey;

@end
