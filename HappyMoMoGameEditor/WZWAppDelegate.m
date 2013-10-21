//
//  WZWAppDelegate.m
//  HappyMoMoGameEditor
//
//  Created by FlameMare on 13-10-12.
//  Copyright (c) 2013年 王 昭威. All rights reserved.
//

#import "WZWAppDelegate.h"
#import "WZWMission.h"

@implementation WZWAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    if (self.gameDataController) {
        [self.gameDataController becomeFirstResponder];
    }
}

@end
