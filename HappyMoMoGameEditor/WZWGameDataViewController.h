//
//  WZWGameDataViewController.h
//  HappyMoMoGameEditor
//
//  Created by FlameMare on 13-10-20.
//  Copyright (c) 2013年 王 昭威. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class WZWGameData;
@interface WZWGameDataViewController : NSViewController <NSTableViewDataSource, NSTableViewDelegate>

@property (strong) WZWGameData* gameData;
@property (weak) IBOutlet NSTableView* missionsTable;

- (IBAction)fileMenuCallBack:(id)sender;
- (IBAction)printValue:(id)sender;

@end
