//
//  WZWMission.m
//  HappyMoMoGameEditor
//
//  Created by FlameMare on 13-10-12.
//  Copyright (c) 2013年 王 昭威. All rights reserved.
//

#import "WZWMission.h"
#import <objc/runtime.h>

@implementation WZWMission

- (id)initWithScore:(float)score timeLimite:(float)timeLimite facials:(NSArray *)facials sequence:(BOOL)sequence totalCount:(int)totalCount obstruction:(NSArray *)obstruction titleFile:(NSString *)titleFileName
{
    self = [super init];
    if (self != nil) {
        _score = score;
        _timeLimite = timeLimite;
        _facials = facials;
        _sequence = sequence;
        _totalCount = totalCount;
        _obstruction = [obstruction copy];
        _titleImgName = titleFileName;
        
        self.rootKey = @"mission";
    }
    return self;
}

@end