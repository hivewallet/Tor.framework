//
//  HITorManager.h
//  Tor
//
//  Created by Bazyli Zygan on 23.07.2013.
//  Copyright (c) 2013 Nova Project. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HITorManager : NSObject

@property (nonatomic, setter = setTorRouting:, getter = torRouting) BOOL torRouting;
@property (nonatomic, assign) NSUInteger port;

+ (HITorManager *)defaultManager;

- (void)start;

- (void)stop;

@end
