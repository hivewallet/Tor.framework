//
//  HIAppDelegate.m
//  HITorDemo
//
//  Created by Bazyli Zygan on 23.07.2013.
//  Copyright (c) 2013 Hive Developers. All rights reserved.
//

#import "HIAppDelegate.h"
#import <Tor/HITorManager.h>

@implementation HIAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    [[HITorManager defaultManager] start];
}

@end
