# XCFindKit

<p align="left">
<a href="https://developer.apple.com/swift"><img alt="Swift 5.3" src="https://img.shields.io/badge/Swift-5.3-orange.svg?style=flat"/></a>
<a href="https://swift.org/package-manager/"><img alt="Swift Package Manager" src="https://img.shields.io/badge/Swift_Package_Manager-compatible-green.svg?style=flat"/></a>
<a href="https://github.com/yutailang0119/ProgressSpinnerKit/blob/master/LICENSE"><img alt="Lincense" src="https://img.shields.io/badge/license-MIT-black.svg?style=flat"/></a>
</p>

## Overview

XCFindKit is the CLI and Library to find the path to installed Xcode.  

### Support

* Find all installed Xcodes
* Find the specified version of Xcode

> Note: XCFindKit is still in development, and the API is not guaranteed to be stable. It's subject to change without warning.  

### Motivation

Inspired by `XcodeFinder` in [giginet/Toybox](https://github.com/giginet/Toybox).  
This uses `/usr/bin/mdfind` command to get a list of installed Xcode.  
And determine the version with `CFBundleShortVersionString` in `/Contents/version.plist` at Xcode.app.  

## Requirements

* Swift 5.3+
* Xcode 12.4+


## CLI: `xcode-find`

### Installation

Download and install [the latest trunk Swift development toolchain](https://swift.org/download/#snapshots).  

#### [Mint](https://github.com/yonaskolb/mint)

```shell
$ mint install yutailang0119/XCFindKit
```

#### From Source

```shell
$ git clone https://github.com/yutailang0119/XCFindKit
$ cd XCFindKit
$ swift build
// And copy generated binary under executable path.
```

### Usage

```
Usage: xcode-find [options]

Print the path to the installed Xcode.

Options:
  -h, --help                                print this help message and exit
  -a, --all                                 print the paths of all installed Xcode
  -p <version>, --print-version <version>   print the path of the selected version Xcode
  -v, --version                             print the xcode-find version
```


## Library: `XCFindKit`


### Installation

#### [Swift Package Manager](https://swift.org/package-manager/)

```swift
// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Package",
    dependencies: [
        .package(
            url: "https://github.com/yutailang0119/XCFindKit",
            from: "0.1.0"
        ),
    ],
    targets: [
        .target(
            name: "Target",
            dependencies: ["XCFindKit"]
        ),
    ]
)
```

### Usage

```swift
import XCFindKit

let finder = XCFindKit.SpotlightXcodeFinder()
let xcodes: [Application] = finder.findXcodes()
let xcode11_2: Application? = finder.find("11.2")
```

## Author

[Yutaro Muta](https://github.com/yutailang0119)
* muta.yutaro@gmail.com
* [@yutailang0119](https://twitter.com/yutailang0119)

## License

XCFindKit is available under the MIT license.  
See [the LICENSE file](./LICENSE) for more info.  
