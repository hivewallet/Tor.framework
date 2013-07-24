//
//  HIAppDelegate.m
//  HITorDemo
//
//  Created by Bazyli Zygan on 23.07.2013.
//  Copyright (c) 2013 Hive Developers. All rights reserved.
//

#import "HIAppDelegate.h"
#import <Tor/Tor.h>

@implementation HIAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    [HITorManager defaultManager].port = 9999;
    [[HITorManager defaultManager] start];
    [HITorManager defaultManager].torRouting = YES;
}

- (void)applicationWillTerminate:(NSNotification *)notification
{
    [[HITorManager defaultManager] stop];
}


- (IBAction)goClicked:(id)sender
{
    [[_webView mainFrame] loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_urlTextField.stringValue]]];
}

- (void)webView:(WebView *)sender didFinishLoadForFrame:(WebFrame *)frame
{
    [_progressIndicator stopAnimation:self];
}

- (void)webView:(WebView *)sender didStartProvisionalLoadForFrame:(WebFrame *)frame
{
    [_progressIndicator startAnimation:self];
}
@end
