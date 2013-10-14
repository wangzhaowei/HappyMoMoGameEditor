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

//  一个GameData就是游戏中的一关
@interface WZWGameData : WZWXMLChain

//  结算时成绩等级的数量，比如如果有不及格，良，优，优+，则为4，超过这个数量的不会被处理
@property (assign) int scoreLevelCount;
//  分数等级, 0 - 1, 百分比计算，1代表满分
@property (copy) NSArray* totalScores;
//  每一个成绩等级的金鼻奖励系数
@property (copy) NSArray* goldRatios;
//  mission 就是关卡中的题目，一个mission就是一个题目, 存储的是WZWMission类的对象
@property (copy) NSArray* missions;

@end
