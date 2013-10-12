//
//  WZWGameData.h
//  HappyMoMoGameEditor
//
//  Created by FlameMare on 13-10-12.
//  Copyright (c) 2013年 王 昭威. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WZWXMLChain.h"
#import "WZWMission.h"

extern const int totalScoreCount;

//  一个GameData就是游戏中的一关
@interface WZWGameData : WZWXMLChain

//  数组长度等于totalScoreCount
@property (assign) float* totalScore;
//  mission 就是关卡中的题目，一个mission就是一个题目, 存储的是WZWMission类的对象
@property (copy) NSArray* missions;

@end
