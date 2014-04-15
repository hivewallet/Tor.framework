Tor.framework
===================

Tor.framework allows you to use Tor network (http://torproject.org) to route your WebKit connections and make your web browsing annonymous. Also, it starts a tor SOCK proxy to route external connections via Tor network as well.

---

**IMPORTANT: We aren't currently working on this framework.** It was created for [Hive](https://github.com/hivewallet/hive-osx), but we haven't used it in the end, and we might actually end up implementing Tor in Hive in a different way. You can try to use it if you want, but we can't provide any support at the moment. It might be a better idea to use one of these instead:

- https://github.com/chatsecure/onionkit
- https://github.com/ChatSecure/Tor.framework


About Tor.framework
--------------------------

The Tor.framework uses original tor project sources to provide this functionality. If your Mac application need the access to tor network, this is what you need.

Build Instructions
------------------

In order to be able to compile this stuff you need to use homebrew and do the following:

	brew install openssl libevent

&

	brew link openssl --force

And remember to fetch tor sources!

	git submodule update --init --recursive

Now you're ready to go!

How to use
----------

Tor.framework delivers a singleton of class HITorManager. With this object you are able to access tor network functionality and manage tor SOCK proxy server.

You can simply run it using:

```objective-c
[[HITorManager defaultManager] start];
```

If you want your NSURLConnection instances to route via tor network simply set the routing

```objective-c
[HITorManager defaultManager].torRouting = YES;
```

And you are ready to go

Demo App
--------

There's a demo application included with the sources. Start it up and check out how to use Tor.framework!

License
-------

Tor.framework is available under the MIT license.
