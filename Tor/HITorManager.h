//
//  HITorManager.h
//  Tor
//
//  Created by Bazyli Zygan on 23.07.2013.
//  Copyright (c) 2013 Nova Project. All rights reserved.
//

#import <Foundation/Foundation.h>

/** Real Tor Manager. Allows you to start and stop tor proxy server that
 *  allows you to route your network via tor.
 */
@interface HITorManager : NSObject

@property (nonatomic, setter = setTorRouting:, getter = torRouting) BOOL torRouting; //<< Enables and disables tor routing for all NSURLRequests
@property (nonatomic, assign) NSUInteger port;                                       //<< Sets a port for tor proxy server

/** Class method returning defult tor manager.
 *
 * Please not that you shouldn't been creating 
 * objects of this class on your own and should rely only on this 
 * single singleton.
 *
 * @returns Tor Manager object
 */
+ (HITorManager *)defaultManager;

/** Starts tor proxy server */
- (void)start;

/** Stops tor proxy server */
- (void)stop;

@end
