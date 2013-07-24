//
//  HITorURLProtocol.m
//  Tor
//
//  Created by Bazyli Zygan on 24.07.2013.
//  Copyright (c) 2013 Nova Project. All rights reserved.
//

#import "HITorURLProtocol.h"
#import "ASIHTTPRequest.h"
#import "HITorManager.h"

@interface HITorURLProtocol ()
{
    ASIHTTPRequest *_torReq;
}
@end

@implementation HITorURLProtocol

+ (BOOL)canInitWithRequest:(NSURLRequest *)request
{
    // only handle http requests we haven't marked with our header.
    if ([[[request URL] scheme] isEqualToString:@"http"] || [[[request URL] scheme] isEqualToString:@"https"])
    {
        return YES;
    }
    return NO;
}

+ (NSURLRequest *)canonicalRequestForRequest:(NSURLRequest *)request
{
    return request;
}

- (void)startLoading
{
    _torReq = [[ASIHTTPRequest alloc] initWithURL:self.request.URL];
    [_torReq setProxyHost:@"127.0.0.1"];
    [_torReq setProxyPort:(int)[HITorManager defaultManager].port];
    [_torReq setProxyType:(NSString *)kCFProxyTypeSOCKS];
    _torReq.delegate = self;
    [_torReq startAsynchronous];
}

- (void)stopLoading
{
    _torReq.delegate = nil;
    [_torReq cancel];
    [_torReq release];
    _torReq = nil;
}

- (void)request:(ASIHTTPRequest *)request didReceiveResponseHeaders:(NSDictionary *)responseHeaders
{
    if (responseHeaders[@"Content-Type"])
    {
//        if (request.responseStatusCode >= 300 && request.responseStatusCode < 400)
//        {
//            [[self client] URLProtocol:self
//                wasRedirectedToRequest:self.request
//                      redirectResponse:[[[NSHTTPURLResponse alloc] initWithURL:self.request.URL statusCode:request.responseStatusCode HTTPVersion:@"HTTP/1.0" headerFields:responseHeaders] autorelease]];
//        }
//        else
//        {
            [[self client] URLProtocol:self didReceiveResponse:[[[NSHTTPURLResponse alloc] initWithURL:self.request.URL statusCode:request.responseStatusCode HTTPVersion:@"HTTP/1.0" headerFields:responseHeaders] autorelease] cacheStoragePolicy:NSURLCacheStorageNotAllowed];
//        }
    }
}


- (void)requestFinished:(ASIHTTPRequest *)request
{
    NSData *data = [request responseData];
    if (data)
        [[self client] URLProtocol:self didLoadData:data];
    [[self client] URLProtocolDidFinishLoading:self];
}

- (void)requestFailed:(ASIHTTPRequest *)request
{
    NSData *data = [request responseData];
    if (data)
        [[self client] URLProtocol:self didLoadData:data];
    
    [[self client] URLProtocol:self didFailWithError:[NSError errorWithDomain:@"com.hive.Tor" code:request.responseStatusCode userInfo:nil]];
}


- (void)dealloc
{
    _torReq.delegate = nil;    
    [_torReq cancel];
    [_torReq release];
    [super dealloc];
}
@end
