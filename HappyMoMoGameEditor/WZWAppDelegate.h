//
//  WZWAppDelegate.h
//  HappyMoMoGameEditor
//
//  Created by FlameMare on 13-10-12.
//  Copyright (c) 2013年 王 昭威. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface WZWAppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;

- (IBAction)fileMenuCallBack:(id)sender;

@end
