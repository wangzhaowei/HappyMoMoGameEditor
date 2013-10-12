//
//  WZWMission.h
//  HappyMoMoGameEditor
//
//  Created by FlameMare on 13-10-12.
//  Copyright (c) 2013年 王 昭威. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WZWXMLChain.h"

typedef enum : NSUInteger
{
    barTitleEnumHasLeft = 1 << 0,
    barTitleEnumHasMedium = 1 << 1,
    barTitleEnumHasRight = 1 << 2
}barTitleEnum;

//  存储题目数据
@interface WZWMission : WZWXMLChain

//  答对这个题目所加的分数
@property (assign) float score;
//  这个题目时间限制, 默认是3s
@property (assign) float timeLimite;
//  本题目所需要触摸的部位, 存储的是NSNumber包装起来的的int
@property (strong) NSArray* facials;
//  是否需要按照顺序触摸, 默认为NO
@property (assign, getter = isSequence) BOOL sequence;
//  需要触摸的次数, 当facials.count为1的时候才有效果, 默认为1
@property (assign) int totalCount;
//  障碍物, 现在还没用
@property (strong) NSArray* obstruction;
//  题目提示标题的图片名称
@property (strong) NSString* titleImgName;

- (id)initWithScore:(float)score timeLimite:(float)timeLimite facials:(NSArray*)facials sequence:(BOOL)sequence totalCount:(int)totalCount obstruction:(NSArray*)obstruction titleFile:(NSString*)titleFileName;

@end
