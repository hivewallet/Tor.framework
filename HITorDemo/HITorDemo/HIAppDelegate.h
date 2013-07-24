//
//  HIAppDelegate.h
//  HITorDemo
//
//  Created by Bazyli Zygan on 23.07.2013.
//  Copyright (c) 2013 Hive Developers. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <WebKit/WebKit.h>
@interface HIAppDelegate : NSObject <NSApplicationDelegate, NSTextFieldDelegate>

@property (weak) IBOutlet NSButton *goBtn;
@property (weak) IBOutlet NSProgressIndicator *progressIndicator;
@property (assign) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSTextField *urlTextField;
@property (weak) IBOutlet WebView *webView;
- (IBAction)goClicked:(id)sender;

@end
