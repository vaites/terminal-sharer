# Terminal Sharer

Apple describes it's [NSSharingService](https://developer.apple.com/documentation/appkit/nssharingservice) as _"a service that lets users share content with other services, such as social media services, or apps, such as Mail and Safari"_.

Terminal Sharer is a command-line tool and daemon to share texts, links, images and videos through this macOS native sharing features.

# Features

* Standalone executable without dependencies
* Three modes: command line, interactive command line and daemon
* Structured output formats to ease integrations

# Installation

You can build from sources having installed Xcode:
```
git clone https://github.com/vaites/terminal-sharer.git
cd terminal-sharer
swift build
```

The executable will be stored at `.build/debug` folder.

# Usage

Just run `terminal-sharer --help` to get usage:
```
  -I, --interactive   Enters interactive mode
  -D, --daemon        Start as a daemon listening for connections
  -i, --image         Path to an image to be shared (optional)
  -l, --link          Link to be shared (optional)
  -s, --service       Service name
  -S, --services      List of available services (only enabled)
  -t, --text          Text to be shared (optional)
  -V, --version       Shows the version number and quit
  -v, --video         Path to a video to be shared (optional)
```