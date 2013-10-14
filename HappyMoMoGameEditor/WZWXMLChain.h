//
//  WZWXMLChain.h
//  HappyMoMoGameEditor
//
//  Created by FlameMare on 13-10-12.
//  Copyright (c) 2013年 王 昭威. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

//  生成XMLElement的流程就是调用createXMLElement或者createXMLElementWithKey:
//  其余方法均为策略模式设计或者其他用途。
@protocol WZWXMLChainEncodeDelegate <NSObject>

@optional
//  调用这个方法来生成当前节点的XML元素,默认使用当前节点的rootkey
- (NSXMLElement *)createXMLElement;
@required
//  这个方法适用于无法添加key的对象
- (NSXMLElement *)createXMLElementWithKey:(NSString*)elemKey;

@end

@interface WZWXMLChain : NSObject <WZWXMLChainEncodeDelegate>

@property (strong) NSString* rootKey;

//  策略模式，可以在子类中重载这个方法，修改xml文件格式
- (NSXMLElement *)createXMLElementWithIvarList:(Ivar*)iVars ivarCount:(NSUInteger)IvarCount rootElement:(NSXMLElement*)rootElem;

//  返回实例变量的XML元素, 如果变量是NSArray则还会检测数组中元素是否是Chain
- (NSXMLElement*)elemValueWithElemKey:(NSString*)elemKey;

//  解析数组，数组中必须是NSNumber数据，多个数据之间只用逗号分隔，且数组中元素必须使用同一个key.
//  数组中元素必须实现WZWXMLChainEncodeDelegate协议
- (NSXMLElement*)encodeArrayToXMLElement:(NSArray*)srcArray elementKey:(NSString*)elemKey;

@end
