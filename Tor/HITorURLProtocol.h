//
//  HITorURLProtocol.h
//  Tor
//
//  Created by Bazyli Zygan on 24.07.2013.
//  Copyright (c) 2013 Nova Project. All rights reserved.
//

#import <Foundation/Foundation.h>

/** Class that takes control of all http and https requests and make them
 *  routable via Tor network.
 *  HITorManager can register and unregister it for you, so you don't need to worry about it.
 */
@interface HITorURLProtocol : NSURLProtocol

@end
