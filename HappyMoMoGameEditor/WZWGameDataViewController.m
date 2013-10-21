//
//  WZWGameDataViewController.m
//  HappyMoMoGameEditor
//
//  Created by FlameMare on 13-10-20.
//  Copyright (c) 2013年 王 昭威. All rights reserved.
//

#import "WZWGameDataViewController.h"
#import "WZWGameData.h"

typedef enum : NSUInteger{
    FileMenuItemTagNew = 0u,
    FileMenuItemTagOpen,
    FileMenuItemTagSave
}FileMenuItemTagEnum;

@interface WZWGameDataViewController ()

- (void)newGameData;
- (void)openGameData;
- (void)saveGameData;

@end

@implementation WZWGameDataViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    self.gameData = [[WZWGameData alloc] init];
    WZWMission* mission = [[WZWMission alloc] init];
    mission.score = 20.f;
    self.gameData.missions = @[mission];
}

- (IBAction)fileMenuCallBack:(id)sender {
    NSUInteger tag = [sender tag];
    switch (tag) {
        case FileMenuItemTagNew:
            [self newGameData];
            break;
        case FileMenuItemTagOpen:
            [self openGameData];
            break;
        case FileMenuItemTagSave:
            [self saveGameData];
            break;
        default:
            @throw WZW_EXCEPTION_NOT_FOUND_MENU_ITEM_TAG(tag);
            break;
    }
}

- (void)printValue:(id)sender
{
    NSLog(@"%lu, %f", [self.gameData.missions count], [self.gameData.missions[1] score]);
}

#pragma mark - private methods
- (void)newGameData
{
    ;
}

- (void)openGameData
{
    ;
}

- (void)saveGameData
{
    ;
}

@end
